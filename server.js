const express = require('express');
const path = require('path');
const app = express();
const PORT = 3000;

const appName = process.env.APP_NAME || 'Unknown App';

app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
  console.log(`[${appName}] Received GET /`);
  res.sendFile(path.join(__dirname, 'views', 'index.html'));
});

app.listen(PORT, () => {
  console.log(`[${appName}] Server running at http://localhost:${PORT}`);
});
