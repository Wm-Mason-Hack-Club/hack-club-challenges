# Code-Server Guide
Here is a little more information about the resources that we are using to make this coding experience possible. 

## Table of Contents
- [What is Code-Server?](#what-is-code-server)
- [Getting Started](#getting-started)
- [Basic Usage](#basic-usage)
- [Python Basics](#python-basics)
- [Tips and Tricks](#tips-and-tricks)
- [Troubleshooting](#troubleshooting)
- [Common Python Packages](#common-python-packages)
- [Conclusion](#conclusion)

## What is Code-Server?

Code-Server is a tool that allows you to run Visual Studio Code on a remote server and access it through your web browser. This enables you to code from anywhere, on any device, without needing to install VS Code locally.

In our setup, Code-Server runs inside a Docker container. This allows you to program with the full power of Linux and Visual Studio Code, providing a consistent and isolated development environment.

For more information about Code-Server, you can visit:
- [Code-Server GitHub Repository](https://github.com/coder/code-server)

If you are unfamiliar with Docker or want to learn more about it, you can check out the following resources:
- [Docker Overview](https://www.docker.com/why-docker)
- [Getting Started with Docker](https://docs.docker.com/get-started/)


## Getting Started

>[!TIP] Since you can see this, you don't need the information. Instead, use it to help guide your teammates to connect to this `code-server` quickly.

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
    - Use the file explorer to navigate to the file you want to open.
    - Click on the file to open it in the editor.

2. **Editing Code**:
    - Make changes to your code in the editor.
    - Use the syntax highlighting and IntelliSense features to help you write code efficiently.

3. **Running Code**:
    - Open the terminal by clicking on the terminal icon or using the shortcut `Ctrl+``.
    - Run your code using the appropriate command for your programming language (e.g., `python script.py` for Python).
> [!WARNING] Each user's terminal is separate, but uses shared resources within the container. You will want to coordinate with your team to balance and coordinate actions.

4. **Saving Changes**:
    - Save your changes by clicking on the save icon or using the shortcut `Ctrl+S`.
    - Saved changes should populate quickly across all logged-in users, but a page refresh should always force an update if needed.

## Python Basics

Python is a versatile and beginner-friendly programming language. Here are some resources and tips to help you get started with Python:

### Learning Resources
- **[W3Schools Python Tutorial](https://www.w3schools.com/python/)**: A comprehensive guide for beginners to learn Python basics.
- **[Python Official Documentation](https://docs.python.org/3/tutorial/)**: The official Python tutorial for in-depth understanding.

### Installing Python and pip
- **Python Installation**: Download and install Python from the [official website](https://www.python.org/downloads/).
- **pip Installation**: pip is the package installer for Python. It is included with Python installation. You can verify the installation by running `pip --version` in your terminal.

### Using pip to Install Packages
pip allows you to install and manage additional libraries and dependencies that are not included in the standard library. Here are some basic commands:
- **Install a package**: `pip install package_name`
- **Upgrade a package**: `pip install --upgrade package_name`
- **Uninstall a package**: `pip uninstall package_name`

### Example: Setting Up a Project
1. **Virtual Environment**:
    You are already in a virtual environment, which is indicated by the `(venv)` prefix in your terminal prompt. This ensures that your project dependencies are isolated from other projects or the code-server environment.

    Virtual environments are useful because they allow you to manage dependencies for different projects separately, avoiding conflicts between packages.

    - If you need to exit the virtual environment, you can simply run:
        ```sh
        deactivate
        ```

    - To re-enter the virtual environment, navigate to your project directory and run:
        ```sh 
        source venv/bin/activate
        ```
****
2. **Install Packages**:
Packages in Python are collections of modules that provide additional functionality and tools to help you build your projects more efficiently. Instead of writing everything from scratch, you can use these pre-built packages to save time and avoid reinventing the wheel.

    In another section called [Common Python Packages](#common-python-packages) there are several commonly-used Python packages you may explore for your projects. These also have instructions for how to install the packages.

    If you want to save your packages in the `requirements.txt` file, use this command: `pip freeze > requirements.txt` To install items in the requirements file, use this command: `pip install -r requirements.txt`


*****
3. **Create a Simple Script**:
    ```python
    # app.py
    import requests

    response = requests.get('https://api.github.com')
    print(response.json())
    ```

*****
4. **Run Your Script**:
    ```sh
    python app.py
    ```

    These steps should help you get started with Python and managing packages using pip. Happy coding!

## Tips and Tricks

- **Extensions**: You can install extensions to enhance your coding experience. Click on the extensions icon on the left sidebar to browse and install extensions.
- **Themes**: Customize the look and feel of your editor by changing the theme. Go to `File > Preferences > Color Theme` to choose a theme.
- **Keyboard Shortcuts**: Familiarize yourself with keyboard shortcuts to improve your productivity. You can find a list of shortcuts in the `Help` menu.

## Troubleshooting

- **Connection Issues**: If you experience connection issues, try refreshing the page or checking your internet connection.
- **Performance**: If the server is slow, close any unnecessary tabs or applications on your device.


## Common Python Packages

  Here are a few common examples of packages that are useful in simple projects:

### Flask
**Description**: Flask is a lightweight web framework for Python. It allows you to build web applications quickly and with a minimal amount of code. Flask is known for its simplicity and flexibility.

**PyPI Link**: [Flask on PyPI](https://pypi.org/project/Flask/)

```sh
pip install flask
```

### Pillow

**Description**: Pillow is a powerful library for image processing in Python. It allows you to open, manipulate, and save many different image file formats. Pillow is a fork of the Python Imaging Library (PIL).

**PyPI Link**: [Pillow on PyPI](https://pypi.org/project/Pillow/)

```sh
pip install pillow
```

### Requests

**Description**: Requests is a simple and elegant HTTP library for Python. It allows you to send HTTP requests easily and handle responses, making it great for interacting with web APIs.
    
**PyPI Link**: Requests on PyPI

```sh
pip install requests
```

These packages can help you accomplish a variety of tasks in your projects, from building web applications to processing images and interacting with web services.


## Conclusion
Code-Server is a powerful tool that allows you to code from anywhere. With this guide, you should be able to get started and make the most out of your coding experience. Happy coding!
