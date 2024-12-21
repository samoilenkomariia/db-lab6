import express from "express";

import {
  getUsers,
  getUserById,
  createUser,
  updateUser,
  deleteUser,
  getTasks,
  getProjects,
  getProjectById,
  getTaskById,
  createProject,
  createTask,
  updateProject,
  updateTask,
  deleteProject,
  deleteTask,
} from "./database.js";

const app = express();

app.use(express.json());

app.get("/users", async (req, res) => {
  const users = await getUsers();
  res.send(users);
});

app.get("/projects", async (req, res) => {
  const projects = await getProjects();
  res.send(projects);
});

app.get("/tasks", async (req, res) => {
  const tasks = await getTasks();
  res.send(tasks);
});

app.get("/users/:id", async (req, res) => {
  const id = req.params.id;
  const user = await getUserById(id);
  res.send(user);
});

app.get("/projects/:id", async (req, res) => {
  const id = req.params.id;
  const project = await getProjectById(id);
  res.send(project);
});

app.get("/tasks/:id", async (req, res) => {
  const id = req.params.id;
  const task = await getTaskById(id);
  res.send(task);
});

app.post("/users", async (req, res) => {
  const { name, email, password } = req.body;
  const user = await createUser(name, email, password);
  res.status(201).send(user);
});

app.post("/projects", async (req, res) => {
  const { name, description } = req.body;
  const project = await createProject(name, description);
  res.status(201).send(project);
});

app.post("/tasks", async (req, res) => {
  const { name, description, status, project_id } = req.body;
  const task = await createTask(name, description, status, project_id);
  res.status(201).send(task);
});

app.put("/users/:id", async (req, res) => {
  const id = req.params.id;
  const { name, email, password } = req.body;
  const updatedUser = await updateUser(id, name, email, password);
  res.status(201).send(updatedUser);
});

app.put("/projects/:id", async (req, res) => {
  const id = req.params.id;
  const { name, description } = req.body;
  const updatedProject = await updateProject(id, name, description);
  res.status(201).send(updatedProject);
});

app.put("/tasks/:id", async (req, res) => {
  const id = req.params.id;
  const { name, status, description, start_date, due_date } = req.body;
  const updatedTask = await updateTask(
    id,
    name,
    status,
    description,
    start_date,
    due_date
  );
  res.status(201).send(updatedTask);
});

app.delete("/users/:id", async (req, res) => {
  const id = req.params.id;
  const result = await deleteUser(id);
  res.status(200).send(result);
});

app.delete("/projects/:id", async (req, res) => {
  const id = req.params.id;
  const result = await deleteProject(id);
  res.status(200).send(result);
});

app.delete("/tasks/:id", async (req, res) => {
  const id = req.params.id;
  const result = await deleteTask(id);
  res.status(200).send(result);
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send("Something went wrong :(");
});

app.listen(8080, () => {
  console.log("Server is running on port 8080");
});
