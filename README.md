# CusorSaaS 🚀

A modern, multi-tenant SaaS application built with React, TypeScript, Node.js, and Supabase. This project provides a complete SaaS boilerplate with authentication, user management, and subscription features out of the box.

## 🚀 Quick Start (Netlify Deployment)

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/yourusername/cusorsaas)

## 📋 Prerequisites

- Node.js (v18 or higher)
- npm (v9 or higher) or yarn
- Git
- Supabase account (free tier available)
- Netlify account (for deployment)

## Features

- 🔐 Authentication with Supabase Auth (Email/Password, Social Logins)
- 🏗️ Role-based access control (Admin, User)
- 📊 Dashboard with analytics and statistics
- 💳 Subscription management with Stripe
- 🎨 Customizable themes (Light/Dark mode)
- 📱 Fully responsive design
- 🚀 Built with modern web technologies

## Tech Stack

- **Frontend**: React, TypeScript, Tailwind CSS
- **Backend**: Node.js, Express, TypeScript
- **Database**: PostgreSQL (via Supabase)
- **Authentication**: Supabase Auth
- **Payments**: Stripe
- **Deployment**: Docker, Kubernetes (optional)

## Prerequisites

- Node.js (v16 or higher)
- npm (v8 or higher)
- PostgreSQL (or use Supabase)
- Supabase account

## Netlify Deployment

### Deploy to Netlify

[![Deploy to Netlify](https://www.netlify.com/img/deploy/button.svg)](https://app.netlify.com/start/deploy?repository=https://github.com/yourusername/cusorsaas)

### Manual Deployment

1. Push your code to a GitHub repository
2. Go to [Netlify](https://app.netlify.com/) and click "New site from Git"
3. Select your Git provider and repository
4. Configure the build settings:
   - **Base directory**: `frontend`
   - **Build command**: `npm install && npm run build`
   - **Publish directory**: `.next`
5. Add environment variables:
   - `NEXT_PUBLIC_API_URL`: Your backend API URL
   - `NEXT_PUBLIC_SUPABASE_URL`: Your Supabase URL
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`: Your Supabase anon key
6. Click "Deploy site"

### Environment Variables

Set these environment variables in your Netlify site settings:

```
NEXT_PUBLIC_API_URL=https://your-backend-api.com
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-supabase-anon-key
NEXT_PUBLIC_GA_TRACKING_ID=your-ga-tracking-id  # Optional
```

## Local Development

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/cusorsaas.git
cd cusorsaas
```

### 2. Set up environment variables

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Update the `.env` file with your Supabase credentials and other configurations.

### 3. Set up Supabase

1. Create a new project at [Supabase](https://supabase.com/)
2. Get your project URL and anon/public key from Project Settings > API
3. Enable Email/Password authentication in Authentication > Providers
4. Set up the database schema by running the SQL migrations in `backend/src/migrations/`

### 4. Install dependencies

Run the setup script to install all dependencies:

```bash
# Make the script executable (Linux/Mac)
chmod +x setup.ps1

# Run the setup script (Windows)
.\setup.ps1
```

### 5. Start the development servers

#### Backend

```bash
cd backend
npm run dev
```

#### Frontend

```bash
cd frontend
npm run dev
```

The application should now be running at `http://localhost:3000`

## Project Structure

```
cusorsaas/
├── backend/                 # Backend server
│   ├── src/
│   │   ├── config/         # Configuration files
│   │   ├── controllers/    # Route controllers
│   │   ├── middleware/     # Express middleware
│   │   ├── migrations/     # Database migrations
│   │   ├── routes/         # API routes
│   │   ├── services/       # Business logic
│   │   ├── types/          # TypeScript type definitions
│   │   └── index.ts        # Application entry point
│   └── package.json
├── frontend/               # Frontend React app
│   ├── public/             # Static files
│   ├── src/
│   │   ├── components/     # Reusable components
│   │   ├── contexts/       # React contexts
│   │   ├── hooks/          # Custom React hooks
│   │   ├── lib/            # Utility functions
│   │   ├── pages/          # Page components
│   │   ├── styles/         # Global styles
│   │   └── App.tsx         # Main App component
│   └── package.json
├── .env.example            # Example environment variables
├── cleanup.ps1             # Script to clean up the project
├── setup.ps1               # Setup script
└── README.md               # This file
```

## Available Scripts

### Backend

- `npm run dev` - Start the development server with hot-reload
- `npm run build` - Build the TypeScript project
- `npm start` - Start the production server
- `npm test` - Run tests
- `npm run lint` - Lint the codebase

### Frontend

- `npm run dev` - Start the development server
- `npm run build` - Build for production
- `npm run start` - Start the production server
- `npm test` - Run tests
- `npm run lint` - Lint the codebase

## Deployment

### Docker

Build and run the application using Docker:

```bash
# Build the images
docker-compose build

# Start the containers
docker-compose up -d
```

### Kubernetes

Deploy to a Kubernetes cluster:

```bash
# Apply the Kubernetes manifests
kubectl apply -f k8s/
```

## Contributing

1. Fork the repository
2. Create a new branch (`git checkout -b feature/awesome-feature`)
3. Commit your changes (`git commit -am 'Add some awesome feature'`)
4. Push to the branch (`git push origin feature/awesome-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Supabase](https://supabase.com/) for the amazing open-source Firebase alternative
- [Tailwind CSS](https://tailwindcss.com/) for the utility-first CSS framework
- [React](https://reactjs.org/) for the frontend library
