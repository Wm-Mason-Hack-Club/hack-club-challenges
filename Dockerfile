FROM codercom/code-server:latest

WORKDIR /app

# Install Python 3 (whatever version is available in the base image)
# --> encourage students to use `python3` and `pip3` to avoid confusion
# --> encourage students to run `python3 --version` to check their versions
RUN sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y python3 && \
    sudo apt-get install -y python3-pip && \
    sudo apt-get install -y python3-venv

# Copy the project files into the container
# --> includes the requirements.txt file and pre-written code
COPY project/ .
COPY USE-GUIDE.md .

# Install the Python extension for VS Code
RUN code-server --install-extension ms-python.python

# Set permissions for the project directory
RUN sudo chmod -R 777 .

# setup a virtual environment, so students can install packages without sudo
RUN python3 -m venv venv
RUN . venv/bin/activate

# install the requirements for this particular project
# RUN pip install -r requirements.txt
# RUN /bin/bash -c "pip install -r requirements.txt"

# Open the workspace to the app folder, where we put all the project files
# CMD ["pip install -r requirements.txt"]
