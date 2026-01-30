const express = require("express");
const path = require("path");

const app = express();

// Serve static files
app.use(express.static(path.join(__dirname, "public")));

// Home page
app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "views", "index.html"));
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Netflix clone running on http://localhost:${PORT}`);
});

