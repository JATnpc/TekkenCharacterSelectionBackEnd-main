# Tekken Character Selection Backend

A RESTful API backend for managing Tekken characters, user authentication, and favorites. Built with Laravel 12, this backend is designed for seamless integration with any frontend.

---

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [API Endpoints](#api-endpoints)
- [Setup & Installation](#setup--installation)
- [Environment & Database](#environment--database)
- [Usage Examples](#usage-examples)
- [Accessing from Local Network](#accessing-from-local-network)
- [Frontend](#frontend)
- [Contributing](#contributing)
- [License](#license)

---

## Project Overview
This backend provides a secure and scalable API for:
- User registration, login, and logout (token-based authentication)
- CRUD operations for Tekken characters
- Managing user favorites (add/remove characters)
- Built-in protection for API endpoints using Laravel Sanctum

---

## Features
- **User Authentication:** Register, login, and logout with secure token-based auth
- **Character Management:** Create, read, update, and delete Tekken characters
- **Favorites:** Users can favorite or unfavorite characters
- **RESTful API:** Clean, predictable endpoints for easy frontend integration
- **SQLite by default:** Simple local setup, easily switchable to MySQL/Postgres

---

## Tech Stack
- **Backend:** Laravel 12 (PHP 8.2+)
- **Database:** SQLite (default), supports MySQL/Postgres
- **Authentication:** Laravel Sanctum (API tokens)
- **Dev Tools:** Composer, Vite (for assets), PHPUnit (for testing)

---

## API Endpoints

### Authentication
| Method | Endpoint         | Description                |
|--------|------------------|----------------------------|
| POST   | /api/register    | Register a new user        |
| POST   | /api/login       | Login and get API token    |
| POST   | /api/logout      | Logout (requires token)    |

### Characters
| Method | Endpoint                | Description                |
|--------|-------------------------|----------------------------|
| GET    | /api/characters         | List all characters        |
| GET    | /api/characters/{id}    | Get a single character     |
| POST   | /api/characters         | Create a new character     |
| PUT    | /api/characters/{id}    | Update a character         |
| DELETE | /api/characters/{id}    | Delete a character         |

### Favorites (require authentication)
| Method | Endpoint                              | Description                        |
|--------|---------------------------------------|------------------------------------|
| GET    | /api/favorites                        | List your favorite characters      |
| POST   | /api/favorites/toggle/{characterId}   | Add/remove a character from favorites |

---

## Setup & Installation

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd TekkenCharacterSelectionBackEnd-main
   ```
2. **Install backend dependencies:**
   ```bash
   composer install
   npm install
   ```
3. **Set up environment variables:**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```
4. **Run database migrations:**
   ```bash
   php artisan migrate
   ```
5. **Start the development server:**
   ```bash
   php artisan serve
   ```
   The API will be available at `http://localhost:8000` by default.

---

## Environment & Database
- **Default database:** SQLite (`database/database.sqlite`)
- To use MySQL/Postgres, update your `.env` file accordingly.
- Make sure to run migrations after changing database settings.

---

## Usage Examples

### Register a User
```bash
curl -X POST http://localhost:8000/api/register \
  -H "Content-Type: application/json" \
  -d '{"name":"Jin","email":"jin@example.com","password":"password","password_confirmation":"password"}'
```

### Login
```bash
curl -X POST http://localhost:8000/api/login \
  -H "Content-Type: application/json" \
  -d '{"email":"jin@example.com","password":"password"}'
```
- Save the `token` from the response for authenticated requests.

### Get All Characters
```bash
curl http://localhost:8000/api/characters
```

### Get Favorites (Authenticated)
```bash
curl http://localhost:8000/api/favorites \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

### Toggle Favorite (Authenticated)
```bash
curl -X POST http://localhost:8000/api/favorites/toggle/1 \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

---

## Accessing from Local Network
To allow other devices on your WiFi to access the API:
1. Find your local IP address (e.g., `<your-local-ip>`).
2. Start the server with:
   ```bash
   php artisan serve --host=0.0.0.0 --port=8000
   ```
3. Access the API from another device using:
   ```
   http://<your-local-ip>:8000/api/characters
   ```
- Ensure your firewall allows connections on port 8000.

---

## Frontend
The frontend for this project is being developed separately by a teammate and will connect to this backend API. For integration details or API usage, see the examples above.

https://github.com/Daveron03/tekkenfinalproject   
---

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request. For major changes, open an issue first to discuss what you would like to change.

---

## License
This project is open-sourced under the MIT license.
