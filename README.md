# Docker Web Application

## Application Description

This project is a simple Docker-based web application with two services:

1. Web Application
2. MySQL Database

The web application runs using Python and Flask. It connects to a MySQL database and records the number of visits to the application.

The application demonstrates Docker containerization, communication between containers, Docker networking, and persistent data storage using a named Docker volume.

---

## Deployment Requirements

The following software is required:

- Ubuntu Linux
- Docker Engine
- Internet connection

Check Docker installation:

```bash
docker --version
```

---

## Network and Volume Details

### Docker Network

The application uses a custom Docker bridge network named `app-network`.

Both the `web-app` and `database` containers are connected to this network.

### Persistent Volume

A named Docker volume called `mysql-data` is used to store the MySQL database data.

The data is preserved even when the containers are stopped and restarted.

---

## Container Configuration

### Web Application Container

- Container Name: `web-app`
- Custom Image: `my-web-app`
- Port: `5000`
- Restart Policy: `on-failure`

### MySQL Database Container

- Container Name: `database`
- Image: `mysql:8.0`
- Port: `3306`
- Restart Policy: `on-failure`
- Persistent Volume: `mysql-data`

---

## Container List

| Container | Role | Port |
|---|---|---|
| web-app | Python Flask web application | 5000 |
| database | MySQL database service | 3306 |
