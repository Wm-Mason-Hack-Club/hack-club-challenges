# Administration of Code-Servers
These are notes and links that may be helpful for any person acting as an administrator, running these containers for students to use. 

## Setup and Config from Coder
- [code-server main page](https://coder.com/)
- [code-server github page](https://github.com/coder/code-server)
- [code-server guide](https://coder.com/docs/code-server/guide)


## Entering Starter Data into Code Servers
To handle different scenarios where you either want to start a container with code in the /projects folder or use a volume to persist data, you can use Docker volumes and bind mounts. Here are your options and how to set them up properly:

### Option 1: Using Bind Mounts
Bind mounts allow you to mount a directory from the host machine into the container. This is useful when you want to work with files on your host machine directly.

#### Docker Compose Example:
In this example, the group1 directory on the host is mounted to /home/coder/project inside the container. Changes made in the container will be reflected on the host and vice versa.
```yaml
services:
  group1:
    hostname: group1 # used in bash-prompt, as group-name
    build:
      context: .
      dockerfile: Dockerfile
    # teams *may* crash the container, if they aren't careful
    restart: no # default 
    ports:
      - "3001:8080" # 300x number is the port for this group
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
    hostname: group1 # used in bash-prompt, as group-name
    build:
      context: .
      dockerfile: Dockerfile
    # teams *may* crash the container, if they aren't careful
    restart: no # default 
    ports:
      - "3001:8080" # 300x number is the port for this group
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

# Set the working directory to the app folder
WORKDIR /home/coder/app

# Install Python 3 (whatever version is available in the base image)
# --> encourage students to run `python3 --version` to check their versions
RUN sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y python3 && \
    sudo apt-get install -y python3-pip && \
    sudo apt-get install -y python3-venv

# Copy the project files into the container
COPY project/ . 
COPY USE-GUIDE.md .

# Set permissions for the project directory
RUN sudo chmod -R 777 .

# Copy the .bashrc file into the home directory
COPY .bashrc /home/coder/.bashrc

# Copy the VS Code settings file to enable dark mode and other settings
COPY settings.json /home/coder/.local/share/code-server/User/settings.json

# Install the Python extension for VS Code
RUN sudo chmod -R 777 /home/coder/.local/share/code-server/ && \
    code-server --install-extension ms-python.python

# setup a virtual environment, so students can install packages without `sudo`
RUN python3 -m venv venv

# Activate the virtual environment, and install any dependencies
RUN . venv/bin/activate && \
    pip install -r requirements.txt
```


### Summary
**Bind Mounts**: Use when you want to work with files directly on the host machine.
**Docker Volumes**: Use when you need to persist data between container restarts or share data between containers.
**No Volume**: Use when you want the container to start with code already in the image.
Choose the option that best fits your use case and update your Docker configuration files accordingly.