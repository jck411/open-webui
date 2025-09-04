#!/bin/bash
# Open WebUI Backend Setup Script
# Avoids common ChromaDB SQLite FTS5 issues by using Milvus

set -e  # Exit on any error

echo "🚀 Setting up Open WebUI Backend..."

# Check if we're in the right directory
if [ ! -f "pyproject.toml" ]; then
    echo "❌ Error: Run this script from the open-webui root directory"
    exit 1
fi

# Install dependencies
echo "📦 Installing dependencies..."
uv sync

# Set up vector database configuration
echo "🔧 Configuring vector database..."
if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "Created .env from .env.example"
else
    echo ".env already exists, skipping"
fi

# Clean any existing ChromaDB data (in case of previous installs)
if [ -d "backend/data/vector_db" ]; then
    echo "🧹 Cleaning existing vector database..."
    rm -rf backend/data/vector_db/chroma*
fi

echo "✅ Setup complete!"
echo ""
echo "🎯 Start the server with:"
echo "   cd backend && ./start.sh"
echo ""
echo "🌐 Server will be available at:"
echo "   - API: http://localhost:8080"
echo "   - Swagger UI: http://localhost:8080/docs"
echo ""
echo "🔑 Default credentials:"
echo "   - Email: admin@localhost"
echo "   - Password: admin"