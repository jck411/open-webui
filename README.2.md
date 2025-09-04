# Open WebUI Backend - Local Development

**Backend-only** repository for Open WebUI. No frontend interface - API testing only.

## Quick Start

**Option 1: Automated Setup (Recommended)**
```bash
./setup.sh
cd backend && ./start.sh
```

**Option 2: Manual Setup**
```bash
# 1. Install dependencies
uv sync

# 2. Set up vector database (avoids ChromaDB SQLite FTS5 issues)
echo "VECTOR_DB=milvus" > .env

# 3. Start server
cd backend
./start.sh
```

Server starts at `http://localhost:8080` | Swagger UI at `http://localhost:8080/docs`

## Authentication

### Get Bearer Token

```bash
curl -X POST "http://localhost:8080/api/v1/auths/signin" \
  -H "Content-Type: application/json" \
  -d '{"email": "admin@localhost", "password": "admin"}'
```

### Use Token in Swagger UI

1. Go to `http://localhost:8080/docs`
2. Click "Authorize" button (🔒)
3. Enter: `Bearer YOUR_TOKEN_FROM_RESPONSE`
4. Click "Authorize"

### Default Credentials
- **Email:** `admin@localhost`
- **Password:** `admin`

## API Examples

```bash
# List models
curl -X GET "http://localhost:8080/api/v1/models" \
  -H "Authorization: Bearer YOUR_TOKEN"

# Create chat
curl -X POST "http://localhost:8080/api/v1/chats/new" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"chat": {"title": "Test Chat"}}'
```

## Notes

- **Vector Database:** Uses Milvus (simpler than ChromaDB, no SQLite FTS5 issues)
- **Database:** `backend/data/webui.db` (SQLite)
- **Vector Storage:** `backend/data/vector_db/milvus.db` (SQLite)
- Tokens don't expire (`expires_at: null`)
- Reset database: delete `backend/data/webui.db`
- Reset vector DB: delete `backend/data/vector_db/milvus.db`
- **Local development only** - default credentials not for production

## Troubleshooting

### If you get ChromaDB/SQLite FTS5 errors:
The default ChromaDB has SQLite FTS5 dependency issues. This repo uses Milvus instead:

```bash
# Ensure .env has the vector DB setting
echo "VECTOR_DB=milvus" > .env

# Clean any existing ChromaDB data
rm -rf backend/data/vector_db/chroma*

# Restart
cd backend && ./start.sh
```

### Switch to PostgreSQL with pgvector (future):
```bash
# In .env file
VECTOR_DB=pgvector
PGVECTOR_DB_URL=postgresql://user:pass@localhost:5432/openwebui
```
