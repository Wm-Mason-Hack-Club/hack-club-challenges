# Administration of Code-Servers

## Entering Starter Data into Code Servers
To handle different scenarios where you either want to start a container with code in the /projects folder or use a volume to persist data, you can use Docker volumes and bind mounts. Here are your options and how to set them up properly:

### Option 1: Using Bind Mounts
Bind mounts allow you to mount a directory from the host machine into the container. This is useful when you want to work with files on your host machine directly.

#### Docker Compose Example:
In this example, the group1 directory on the host is mounted to /home/coder/project inside the container. Changes made in the container will be reflected on the host and vice versa.
```yaml
services:
  group1:
    build:
      context: .
      dockerfile: Dockerfile
    restart: no
    ports:
      - "3001:8080"
    environment:
      - PASSWORD=${PASSWORD_GROUP1}
    volumes:
      - ./vols/group1:/home/coder/project
```

### Option 2: Using Docker Volumes
Docker volumes are managed by Docker and are useful for persisting data between container restarts or sharing data between multiple containers.

#### Docker Compose Example:
In this example, a Docker volume named group1_data is created and mounted to /home/coder/project inside the container. Docker manages the volume's lifecycle.
```yaml
services:
  group1:
    build:
      context: .
      dockerfile: Dockerfile
    restart: no
    ports:
      - "3001:8080"
    environment:
      - PASSWORD=${PASSWORD_GROUP1}
    volumes:
      - group1_data:/home/coder/project

volumes:
  group1_data:
```

### Option 3: No Volume (Using Code in the Image)
If you want the container to start with code already in the /projects folder without using volumes, you can copy the code into the image during the build process.

#### Dockerfile Example:
Switching Between Options
You can switch between these options by modifying your docker-compose.yaml file and Dockerfile as needed. For example, to switch from using a bind mount to using a Docker volume, update the volumes section in the docker-compose.yaml file accordingly.
```dockerfile
FROM codercom/code-server:latest

WORKDIR /app

# Install Python 3 (whatever version is available in the base image)
RUN sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y python3 && \
    sudo apt-get install -y python3-pip && \
    sudo apt-get install -y python3-venv

# Copy the project files into the container
COPY project/ /home/coder/project

# Install the Python extension for VS Code
RUN code-server --install-extension ms-python.python

# Set permissions for the project directory
RUN sudo chmod -R 777 /home/coder/project

# setup a virtual environment, so students can install packages without sudo
RUN python3 -m venv venv
RUN . venv/bin/activate

# install the requirements for this particular project
RUN pip install -r /home/coder/project/requirements.txt

# Start code-server with the /app directory as the workspace
CMD ["code-server", "--bind-addr", "0.0.0.0:8080", "/home/coder/project"]
```


### Summary
**Bind Mounts**: Use when you want to work with files directly on the host machine.
**Docker Volumes**: Use when you need to persist data between container restarts or share data between containers.
**No Volume**: Use when you want the container to start with code already in the image.
Choose the option that best fits your use case and update your Docker configuration files accordingly.