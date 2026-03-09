## Quran Ayah Explorer – Full‑Stack App

Beautiful, modern Quran ayah explorer with a Node.js + Express backend and React (Vite) + Tailwind CSS frontend.

### Project Structure

- **backend**: Node.js + Express API
- **frontend**: React (Vite) SPA with Tailwind, Framer Motion, React Icons

---

### Backend – Setup & Running

1. Open a terminal and go to the backend folder:

```bash
cd quran-app/backend
```

2. Install dependencies:

```bash
npm install
```

3. Start the development server:

```bash
npm run dev
```

This starts Express on **http://localhost:5000**.

#### Backend Routes

- **GET** `/health`
  Returns:

  ```json
  { "status": "ok" }
  ```

- **GET** `/api/ayah?surah=2&ayah=255`
  Returns:

  ```json
  {
    "surah_name": "Al-Baqarah",
    "surah_number": 2,
    "ayah_number": 255,
    "arabic": "…",
    "translation": "…"
  }
  ```

---

### Frontend – Setup & Running

1. Open another terminal and go to the frontend folder:

```bash
cd quran-app/frontend
```

2. Install dependencies:

```bash
npm install
```

3. Start the Vite dev server:

```bash
npm run dev
```

By default Vite runs on **http://localhost:5173**.
Open that URL in your browser while the backend is running on port **5000**.

The frontend is already configured to call the backend at `http://localhost:5000/api/ayah`.

---

### Notes on Costs / Billing

- This project uses the free **api.alquran.cloud** service for Quran data (no built‑in billing in this code).
- Any costs you might see are only from:
  - Your own hosting (if you deploy to a paid provider).
  - Your own usage of tooling / cloud services outside this repository.
