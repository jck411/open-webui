# Open WebUI Backend - Local Development

**Backend-only** repository for Open WebUI. No frontend interface - API testing only.

## Quick Start

```bash
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

- Database: `backend/data/webui.db` (SQLite)
- Tokens don't expire (`expires_at: null`)
- Reset database: delete `backend/data/webui.db`
- **Local development only** - default credentials not for production