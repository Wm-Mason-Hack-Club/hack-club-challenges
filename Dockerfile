FROM codercom/code-server:latest

# Set the working directory to the app folder
WORKDIR /home/coder/app

# Install Python 3 (whatever version is available in the base image)
# --> encourage students to use `python3` and `pip3` to avoid confusion
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

# Install the Python extension for VS Code
RUN sudo chmod -R 777 /home/coder/.local/share/code-server/ && \
    code-server --install-extension ms-python.python

# setup a virtual environment, so students can install packages without `sudo`
RUN python3 -m venv venv

# Activate the virtual environment, and install any dependencies
RUN . venv/bin/activate && \
    pip install -r requirements.txt