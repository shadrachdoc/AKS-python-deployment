# Use slimmer python:3.6-alpine base image
FROM python:3.9.19-alpine

# Set non-root user
RUN addgroup -S app && adduser -S app -G app

# Install sudo
RUN apk add --no-cache sudo

# Allow the app user to run commands as sudo without a password
RUN echo "app ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/app

USER app

# Install Node.js
RUN sudo apk add --no-cache nodejs npm

# Install Snyk
RUN npm config set prefix /home/app/.npm
RUN npm install snyk -g

# Copy requirements and install
COPY ./py_flash /app
WORKDIR /app
RUN pip install -r requirements.txt --upgrade

# Run app
ENTRYPOINT ["python"]
CMD ["app.py"]
