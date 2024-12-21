import mysql from "mysql2";
import dotenv from "dotenv";
dotenv.config();

const pool = mysql
  .createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
  })
  .promise();

export async function getUsers() {
  const [rows] = await pool.query("SELECT * FROM user");
  return rows;
}

export async function getUserById(id) {
  const [rows] = await pool.query(
    `SELECT * 
        FROM user
        WHERE id = ?`,
    id
  );
  return rows[0];
}

export async function createUser(name, email, password) {
  const result = await pool.query(
    `
    INSERT INTO user (name, email, password)
    VALUES (?, ?, ?)
    `,
    [name, email, password]
  );
  return result;
}

export async function updateUser(id, name, email, password) {
  const result = await pool.query(
    `
    UPDATE user
    SET name = ?, email = ?, password = ?
    WHERE id = ?
    `,
    [name, email, password, id]
  );
  return result;
}

export async function deleteUser(id) {
  const result = await pool.query(
    `
      DELETE FROM user
      WHERE id = ?
      `,
    id
  );
  return result;
}

export async function getProjects() {
  const [rows] = await pool.query("SELECT * FROM project");
  return rows;
}

export async function getProjectById(id) {
  const [rows] = await pool.query(
    `
    SELECT * 
    FROM project
    WHERE id = ?`,
    id
  );
  return rows[0];
}

export async function createProject(name, description) {
  const result = await pool.query(
    `
    INSERT INTO project (name, description)
    VALUES (?, ?)`,
    [name, description]
  );
  return result;
}

export async function updateProject(id, name, description) {
  const result = await pool.query(
    `
    UPDATE project
    SET name = ?, description = ?
    WHERE id = ?
    `,
    [name, description, id]
  );
  return result;
}

export async function deleteProject(id) {
  const result = await pool.query(
    `
    DELETE FROM project
    WHERE id = ?
    `,
    id
  );
  return result;
}

export async function getTasks() {
  const [rows] = await pool.query("SELECT * FROM task");
  return rows;
}

export async function getTaskById(id) {
  const [rows] = await pool.query(
    `
    SELECT *
    FROM task
    WHERE id = ?
    `,
    id
  );
  return rows[0];
}

export async function createTask(name, description, status, project_id) {
  const result = await pool.query(
    `
    INSERT INTO task (name, description, status, project_id)
    VALUES (?, ?, ?, ?)
    `,
    [name, description, status, project_id]
  );
  return result;
}

export async function updateTask(
  id,
  name,
  status,
  description,
  start_date,
  due_date
) {
  const result = await pool.query(
    `
    UPDATE task
    SET name = ?, status = ?, description = ?, start_date = ?, due_date = ?
    WHERE id = ?
    `,
    [name, status, description, start_date, due_date, id]
  );
  return result;
}

export async function deleteTask(id) {
  const result = await pool.query(
    `
    DELETE FROM task
    WHERE id = ?
    `,
    id
  );
  return result;
}
