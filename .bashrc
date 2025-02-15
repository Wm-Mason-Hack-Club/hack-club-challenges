# Set a simple and clean prompt based on the container's group name
if [ -n "$HOSTNAME" ]; then
    PS1='\[\e[0;32m\]\u@\[\e[0;34m\]${HOSTNAME}:\[\e[0;33m\]\w\[\e[0m\]\$ '
else
    PS1='\[\e[0;32m\]\u@\[\e[0;34m\]host:\[\e[0;33m\]\w\[\e[0m\]\$ '
fi

# Clear the terminal screen
clear
