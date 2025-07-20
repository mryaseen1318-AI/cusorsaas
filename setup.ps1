#!/usr/bin/env pwsh

# Check if Node.js is installed
$nodeVersion = node --version
if (-not $nodeVersion) {
    Write-Host "Node.js is not installed. Please install Node.js v16 or higher and try again." -ForegroundColor Red
    exit 1
}

# Check if npm is installed
$npmVersion = npm --version
if (-not $npmVersion) {
    Write-Host "npm is not installed. Please install npm and try again." -ForegroundColor Red
    exit 1
}

# Navigate to backend directory
$backendPath = Join-Path $PSScriptRoot "backend"
if (-not (Test-Path $backendPath)) {
    Write-Host "Backend directory not found." -ForegroundColor Red
    exit 1
}

Set-Location $backendPath

# Create .env file if it doesn't exist
$envFile = Join-Path $PSScriptRoot ".env"
if (-not (Test-Path $envFile)) {
    $envExample = Join-Path $PSScriptRoot ".env.example"
    if (Test-Path $envExample) {
        Copy-Item $envExample $envFile
        Write-Host "Created .env file from .env.example" -ForegroundColor Green
    } else {
        Write-Host ".env.example not found. Please create a .env file manually." -ForegroundColor Yellow
    }
}

# Install dependencies
Write-Host "Installing backend dependencies..." -ForegroundColor Cyan
npm install

# Check if TypeScript is installed
$tsInstalled = npm list -g typescript --depth=0
if (-not $tsInstalled -or $tsInstalled -match "empty") {
    Write-Host "Installing TypeScript globally..." -ForegroundColor Cyan
    npm install -g typescript
}

# Build the project
Write-Host "Building the project..." -ForegroundColor Cyan
tsc

# Check if build was successful
if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed. Please check the TypeScript errors above." -ForegroundColor Red
    exit 1
}

# Navigate to frontend directory
$frontendPath = Join-Path $PSScriptRoot "frontend"
if (Test-Path $frontendPath) {
    Set-Location $frontendPath
    
    # Install frontend dependencies
    Write-Host "Installing frontend dependencies..." -ForegroundColor Cyan
    npm install
    
    # Build frontend
    Write-Host "Building frontend..." -ForegroundColor Cyan
    npm run build
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Frontend build failed. Please check the errors above." -ForegroundColor Red
        exit 1
    }
}

Write-Host "Setup completed successfully!" -ForegroundColor Green
Write-Host "To start the backend server, run: cd backend && npm start" -ForegroundColor Cyan
Write-Host "To start the frontend development server, run: cd frontend && npm run dev" -ForegroundColor Cyan
