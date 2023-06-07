const express = require("express");
const { Server } = require("ws");
const PORT = process.env.PORT || 3010;

const server = express()
  .use((req, res) => res.send("Hello Ne"))
  .listen(PORT, () => console.log(`Listenning on ${PORT}`));

const wss = new Server({ server });

wss.on("connection", (ws) => {
  console.log("Client connected");
  ws.on("message", (message) => console.log(`Recived: ${message}`));
  ws.on("close", () => console.log("client disconnect"));
});
