# 🧠 Dr. House Fan Page

A simple Node.js web app that serves a fan page about the TV series **House M.D.** — includes a photo of Dr. House, interesting facts, award highlights, and some of his most famous quotes.

---

## 🚀 Features

* 🖼️ Static webpage with a photo of Dr. House
* 📟 Sections for trivia, awards, and quotes
* ⚡ Lightweight Express.js server
* 🐳 Dockerized for easy deployment
* 🛠️ Makefile for common development tasks

---

## 📸 Preview

![App Homepage](public/images/homepage.png)

---

## 📁 Project Structure

```
dr-house-app/
├── public/             # Static files (image, CSS)
│   ├── images/
│   └── styles.css
├── views/              # HTML templates
│   └── index.html
├── server.js           # Express server
├── Dockerfile          # Docker build config
├── Makefile            # Common dev commands
├── .gitignore
└── README.md
```

---

## 🧑‍💻 Local Development

> Prerequisites: Node.js ≥ 22, npm

```bash
# Install dependencies
npm install

# Start the app
npm start

# Or run with Makefile
make local
```

Then open [http://localhost:3000](http://localhost:3000) in your browser.

---

## 🐳 Running with Docker

Build and run in one line:

```bash
make restart
```

Or manually:

```bash
docker build -t dr-house-app .
docker run -p 3000:3000 dr-house-app
```

---

## ⚙️ Makefile Commands

| Command        | Description                       |
| -------------- | --------------------------------- |
| `make build`   | Build Docker image                |
| `make run`     | Run container from image          |
| `make stop`    | Stop and remove running container |
| `make restart` | Rebuild and rerun container       |
| `make logs`    | View container logs               |
| `make clean`   | Remove dangling images            |
| `make local`   | Run locally with Node.js          |

---

## 📦 License

This project is for educational/demo purposes only. All trademarks and content related to **House M.D.** are the property of their respective owners.

---

## 🙌 Acknowledgments

* [Node.js](https://nodejs.org/)
* [Express](https://expressjs.com/)
* [Docker](https://www.docker.com/)
