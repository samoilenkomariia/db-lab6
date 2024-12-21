
-- Permission Table
CREATE TABLE permission (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(64) UNIQUE
);

-- Role Table
CREATE TABLE role (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  description VARCHAR(64)
);

-- Grant Table (Associating roles with permissions)
CREATE TABLE grant (
  role_id INT,
  permission_id INT,
  PRIMARY KEY (role_id, permission_id),
  FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  FOREIGN KEY (permission_id) REFERENCES permission(id) ON DELETE CASCADE
);

-- User Table
CREATE TABLE user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  profile_picture VARCHAR(255),
  status ENUM('BANNED', 'NOT_BANNED') DEFAULT 'NOT_BANNED'
);

-- Project Table
CREATE TABLE project (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  description VARCHAR(512),
  creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  status ENUM('ACTIVE', 'INACTIVE') NOT NULL
);

-- Member Table (Associating users with projects and roles)
CREATE TABLE member (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  project_id INT,
  role_id INT,
  FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
  FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE,
  FOREIGN KEY (role_id) REFERENCES role(id)
);

-- Task Table
CREATE TABLE task (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  status VARCHAR(16) NOT NULL,
  description VARCHAR(512),
  start_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  due_date DATETIME,
  project_id INT,
  FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE
);

-- Task Comment Table
CREATE TABLE task_comment (
  id INT AUTO_INCREMENT PRIMARY KEY,
  content VARCHAR(1024) NOT NULL,
  creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  task_id INT,
  author_id INT,
  FOREIGN KEY (task_id) REFERENCES task(id) ON DELETE CASCADE,
  FOREIGN KEY (author_id) REFERENCES member(id) ON DELETE CASCADE
);

-- Tag Table
CREATE TABLE tag (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(16) NOT NULL,
  color VARCHAR(16) NOT NULL
);

-- TasksTag Table (Associating tasks with tags)
CREATE TABLE tasks_tag (
  task_id INT,
  tag_id INT,
  PRIMARY KEY (task_id, tag_id),
  FOREIGN KEY (task_id) REFERENCES task(id) ON DELETE CASCADE,
  FOREIGN KEY (tag_id) REFERENCES tag(id) ON DELETE CASCADE
);

-- Assignee Table (Associating members with tasks)
CREATE TABLE assignee (
  id INT AUTO_INCREMENT PRIMARY KEY,
  member_id INT,
  task_id INT,
  FOREIGN KEY (member_id) REFERENCES member(id) ON DELETE CASCADE,
  FOREIGN KEY (task_id) REFERENCES task(id) ON DELETE CASCADE,
  UNIQUE (member_id, task_id)
);
