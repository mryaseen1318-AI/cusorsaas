#!/usr/bin/env pwsh

# Deployment script for CusorSaaS
# Usage: .\deploy.ps1 [environment]

param (
    [string]$environment = "production"
)

$ErrorActionPreference = "Stop"

Write-Host "🚀 Starting CusorSaaS deployment to $environment environment..." -ForegroundColor Cyan

# Check if Docker is running
try {
    docker info | Out-Null
} catch {
    Write-Host "❌ Docker is not running. Please start Docker and try again." -ForegroundColor Red
    exit 1
}

# Load environment variables
$envFile = ".env.$environment"
if (-not (Test-Path $envFile)) {
    Write-Host "⚠️  $envFile not found. Using .env file instead." -ForegroundColor Yellow
    $envFile = ".env"
}

if (-not (Test-Path $envFile)) {
    Write-Host "❌ No .env file found. Please create one from .env.example" -ForegroundColor Red
    exit 1
}

# Load environment variables
Get-Content $envFile | ForEach-Object {
    $name, $value = $_.Split('=', 2)
    if ($name -and $name[0] -ne '#') {
        [System.Environment]::SetEnvironmentVariable($name, $value.Trim('"'))
    }
}

# Build and start services
Write-Host "🔨 Building and starting services..." -ForegroundColor Cyan

try {
    # Stop and remove existing containers
    Write-Host "🛑 Stopping and removing existing containers..." -ForegroundColor Yellow
    docker-compose -f docker-compose.prod.yml down --remove-orphans

    # Pull latest images if any
    Write-Host "📥 Pulling latest images..." -ForegroundColor Cyan
    docker-compose -f docker-compose.prod.yml pull

    # Build services
    Write-Host "🔧 Building services..." -ForegroundColor Cyan
    docker-compose -f docker-compose.prod.yml build

    # Start services
    Write-Host "🚀 Starting services..." -ForegroundColor Cyan
    docker-compose -f docker-compose.prod.yml up -d

    # Run database migrations
    Write-Host "🔄 Running database migrations..." -ForegroundColor Cyan
    docker-compose -f docker-compose.prod.yml exec backend npx ts-node src/scripts/run-migrations.ts

    Write-Host "✅ Deployment completed successfully!" -ForegroundColor Green
    Write-Host "🌐 Application is running at: $($env:FRONTEND_URL)" -ForegroundColor Green

} catch {
    Write-Host "❌ Deployment failed: $_" -ForegroundColor Red
    exit 1
}

# Show container status
Write-Host "\n📊 Container status:" -ForegroundColor Cyan
docker-compose -f docker-compose.prod.yml ps
