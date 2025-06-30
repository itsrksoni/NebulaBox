#!/bin/bash

set -e

echo "👉 [Jenkins] Starting CI run inside Docker"
echo "📁 Workspace: $(pwd)"

echo "🧹 Stopping and cleaning any old containers..."
docker compose -f docker-compose.yml down --volumes --remove-orphans

echo "🐳 Building and starting containers..."
docker compose -f docker-compose.yml up --build -d db web

echo "⏳ Waiting for Postgres to be ready..."
sleep 10  # Optionally replace with wait-for-it.sh or healthcheck

echo "🧪 Running RSpec inside web container..."
docker compose exec web bundle exec rspec

echo "🧹 Tearing down containers after tests..."
docker compose -f docker-compose.yml down --volumes --remove-orphans

echo "✅ Tests completed successfully"
