-- Inserting Permissions
INSERT INTO permission (name) VALUES
  ('CREATE_PROJECT'),
  ('UPDATE_PROJECT'),
  ('DELETE_PROJECT'),
  ('CREATE_TASK'),
  ('UPDATE_TASK'),
  ('DELETE_TASK'),
  ('CREATE_COMMENT'),
  ('UPDATE_COMMENT'),
  ('DELETE_COMMENT'),
  ('CREATE_MEMBER'),
  ('UPDATE_MEMBER'),
  ('DELETE_MEMBER'),
  ('BAN_USER'),
  ('UNBAN_USER');

-- Inserting Roles
INSERT INTO role (name, description) VALUES
  ('ADMINISTRATOR', 'Has full access'),
  ('MANAGER', 'Manages projects and teams'),
  ('WORKER', 'Works on tasks');

-- Inserting Grants for Roles
-- Grants for Administrator
INSERT INTO grant (role_id, permission_id) VALUES
  (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), 
  (1, 9), (1, 10), (1, 11), (1, 12), (1, 13), (1, 14);

-- Grants for Manager
INSERT INTO grant (role_id, permission_id) VALUES
  (2, 2), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), 
  (2, 10), (2, 11), (2, 12);

-- Grants for Worker
INSERT INTO grant (role_id, permission_id) VALUES
  (3, 5), (3, 6), (3, 7), (3, 8), (3, 9);

-- Inserting Users
INSERT INTO user (name, email, password, profile_picture, status) VALUES
  ('Ivan Shevchenko', 'ivan.shevchenko@example.com', 'hashed_password_1', 'https://example.com/profile1.jpg', 'NOT_BANNED'),
  ('Olga Ivanova', 'olga.ivanova@example.com', 'hashed_password_2', 'https://example.com/profile2.jpg', 'NOT_BANNED'),
  ('Natalia Kovalenko', 'natalia.kovalenko@example.com', 'hashed_password_3', NULL, 'NOT_BANNED'),
  ('Mykola Petrov', 'mykola.petrov@example.com', 'hashed_password_4', 'https://example.com/profile4.jpg', 'NOT_BANNED'),
  ('Daryna Tarasenko', 'daryna.tarasenko@example.com', 'hashed_password_5', 'https://example.com/profile5.jpg', 'NOT_BANNED');

-- Inserting Project
INSERT INTO project (name, description, status) VALUES 
  ('Project Alpha', 'A description for Project Alpha', 'ACTIVE');

-- Inserting Members for the Project
INSERT INTO member (user_id, project_id, role_id) VALUES
  (1, 1, 1), (2, 1, 2), (3, 1, 3), (4, 1, 3), (5, 1, 3);

-- Inserting Tasks for the Project
INSERT INTO task (name, status, description, project_id) VALUES
  ('Task 1', 'OPEN', 'Task 1 description', 1);

-- Inserting Task Comments
INSERT INTO task_comment (content, task_id, author_id) VALUES
  ('This is the first comment on Task 1', 1, 1);

-- Inserting Tags
INSERT INTO tag (name, color) VALUES
  ('Backend', '#FF5733'),
  ('Frontend', '#33C1FF'),
  ('Testing', '#FF9800');

-- Associating Tasks with Tags
INSERT INTO tasks_tag (task_id, tag_id) VALUES
  (1, 1);

-- Inserting Assignees for Task
INSERT INTO assignee (member_id, task_id) VALUES
  (1, 1), (2, 1), (3, 1), (4, 1), (5, 1);

