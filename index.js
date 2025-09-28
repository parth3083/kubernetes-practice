import express from "express";

const app = express();
app.use(express.json());
const port  = process.env.PORT || 3000

app.get("/", (req, res) => {
  res.json({
    message: "Hello from container",
    service: "heelo-node",
    pod: process.env.POD_NAME || "unknown",
    time: new Date().toISOString(),
  });
});

app.get("/readyz", (req, res) => res.status(200).send("ready"));
app.get("/healthz", (req, res) => res.status(200).send("ok"));

app.listen(port, (req, res) => {
  console.log(`server started on the port : http://localhost:${port}`);
});
