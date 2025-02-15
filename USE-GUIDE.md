# Student Use Guide
Students will need to be able to log in to the code-server to participate in these coding exercises. 

## Table of Contents
- [What is Code-Server?](#what-is-code-server)
- [Getting Started](#getting-started)
- [Basic Usage](#basic-usage)

## What is Code-Server?

Code-Server is a tool that allows you to run Visual Studio Code on a remote server and access it through your web browser. This enables you to code from anywhere, on any device, without needing to install VS Code locally.

In our setup, Code-Server runs inside a Docker container. This allows you to program with the full power of Linux and Visual Studio Code, providing a consistent and isolated development environment.

For more information about Code-Server, you can visit:
- [Code-Server GitHub Repository](https://github.com/coder/code-server)

If you are unfamiliar with Docker or want to learn more about it, you can check out the following resources:
- [Docker Overview](https://www.docker.com/why-docker)
- [Getting Started with Docker](https://docs.docker.com/get-started/)


## Getting Started

To access the code-server, you will need the following information:

- **Host Computer's Network**: you will need to be on the same network as the host.
- **IP Address**: The IP address where the code-server is being hosted.
- **Port Number**: The port number assigned to your group.
- **Secret Password**: The password for your group, which you can obtain from the person running the session.

Make sure to have this information handy before you proceed.

1. **Accessing Code-Server**:
    - Open your web browser.
    - Navigate to the URL provided by your instructor or project lead.

2. **Logging In**:
    - Enter the password provided to you by your instructor or project lead.
    - Click on the "Sign In" button.

3. **Exploring the Interface**:
    - The interface is similar to the desktop version of VS Code.
    - You will see a file explorer on the left, an editor in the center, and a terminal at the bottom. If the terminal is not visible at startup, click on the three lines menu (hamburger button) in the top-left.

## Basic Usage

1. **Opening a File**:
    - Use the file explorer on the left to navigate to the file you want to open.
    - Click on the file to open it in the editor.

2. **Editing Code**:
    - Make changes to your code in the editor.
    - Use the syntax highlighting and IntelliSense features to help you write code efficiently.

3. **Running Code**:
    - Open the terminal by navigating to the menu option, clicking on the terminal icon, or using the shortcut `Ctrl+Shift+C`.
    - Run your code using the appropriate command for your programming language (e.g., `python3 script.py` for Python).
> [!WARNING] Each user's terminal is separate, but uses shared resources within the container. You will want to coordinate with your team to balance and coordinate actions.

4. **Saving Changes**:
    - Changes to the documents should happen automatically, but you can manually force file saves with the hotkey combo: `Ctrl+S`.
    - Saved changes should populate quickly across all logged-in users, but a page refresh should always force an update if needed.
    - It is up to the administrator to decide (in the configuration) if your files will be saves beyond a given session. You will want to ask if you can expect the files to persists after the container is shut down. (Assume files will be deleted when the session is over, but ask if you're curious.)
