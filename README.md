# God'sEye :eyes: Hardware Development
This branch contains:
    
    1.  the config files of the cameras.

    2.  the config files of the webhook development tool, ngrok.

    3.  the bash scripts that run on the Raspberry Pi.

    4.  the python script that communicates with the backend server.


## Documentation :books:

Guidelines to how this setup can be done are available <a href="https://github.com/aibenStunner/dev.backend.io/blob/hardwareDev/docs.pdf">here</a>.

## Technical Details :seedling:

This hardware setup makes use of <a href="https://motion-project.github.io/">Motion</a>, an open source highly configurable program that monitors video signals from many types of cameras, to access the camera feeds.

The camera feeds are made accessible over the internet using <a href="https://ngrok.com/">ngrok</a>, a secure introspectable tunnels to localhost webhook development tool and debugging tool.

Other scripts (Python, BASH) were written to enable the setup function as a single unit.