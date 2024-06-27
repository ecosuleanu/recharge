One of the first challenges of this lab was figuring out our dependencies and their versions mismatch and adding them to the requirements.txt file
- Flask - web framework for Python;
- gunicorn - Python WSGI HTTP server for UNIX;
- Jinja2 - template engine for Python;
- itsdangerous - Flask library that provides security-related utilities;
- Werkzeug -  WSGI web application library for Python.

All these dependencies ensure that our Python application runs with specific versions of Flask (1.1.2), Gunicorn (19.9.0) as the server, and compatible versions of Jinja2 (<3.1), itsdangerous (1.1.0), and Werkzeug (1.0.1). Pinning dependencies to specific versions helps maintain stability and predictability across different environments and deployments of our application.

----

Ensuring the SSL keypair is available to nginx, but is not baked into the container image.
- To ensure this, we mount the SSL certificate and key as volumes at runtime. The sensitive SSL files are kept on the host machine and only mounted into the container as read-only volumes. This maintains security while allowing Nginx to access the necessary SSL files.

---

Allow local edits of the app source to be reflected in the running app container without restart (eg: hot code reload)

- To allow local edits without restarting the container, we pass a --reload flag in the CMD directive that starts gunicorn in the application Dockerfile. 
CMD ["gunicorn", "--reload", "-w", "4", "-b", "0.0.0.0:8000", "server:app"]
