# Tekken Character Selection Backend

A RESTful backend API for managing Tekken characters, user authentication, and favorites. Built with Laravel 12 and designed for easy integration with a frontend or mobile app.

---

## Features

- User registration, login, and logout (token-based authentication)
- CRUD operations for Tekken characters
- Favorite/unfavorite characters (per user)
- Secure endpoints using Laravel Sanctum
- SQLite database by default (easy local setup)

---

## API Endpoints

### Authentication
- `POST /api/register` — Register a new user
- `POST /api/login` — Login and receive an API token
- `POST /api/logout` — Logout (requires authentication)

### Characters
- `GET /api/characters` — List all characters
- `GET /api/characters/{id}` — Get a single character
- `POST /api/characters` — Create a new character
- `PUT /api/characters/{id}` — Update a character
- `DELETE /api/characters/{id}` — Delete a character

### Favorites (require authentication)
- `GET /api/favorites` — List your favorite characters
- `POST /api/favorites/toggle/{characterId}` — Add or remove a character from your favorites

---

## Quick Start

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd TekkenCharacterSelectionBackEnd-main
   ```
2. **Install dependencies:**
   ```bash
   composer install
   npm install
   ```
3. **Set up environment:**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```
4. **Run migrations:**
   ```bash
   php artisan migrate
   ```
5. **Start the server:**
   ```bash
   php artisan serve
   ```
   The API will be available at `http://localhost:8000`.

---

## Example: Register & Get Characters

```bash
# Register
curl -X POST http://localhost:8000/api/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Jin","email":"jin@example.com","password":"password","password_confirmation":"password"}'

# Login
curl -X POST http://localhost:8000/api/login \
  -H "Content-Type: application/json" \
  -d '{"email":"jin@example.com","password":"password"}'

# Get all characters
curl http://localhost:8000/api/characters
```

---

## Tech Stack
- Laravel 12 (PHP 8.2+)
- SQLite (default, can be changed)
- Sanctum for API authentication
- Vite for asset bundling (if using frontend)

---

## Frontend

The frontend for this project is being developed separately by a teammate and will connect to this backend API. For integration details or API usage, see the examples above.

<!-- Optionally, add your friend's frontend repo link here: -->
<!-- [Frontend Repository](https://github.com/your-friend/frontend-repo) -->

---

## License

This project is open-sourced under the MIT license.
