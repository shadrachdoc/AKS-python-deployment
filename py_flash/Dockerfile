# Use slimmer python:3.6-alpine base image
FROM python:3.6-alpine

# Set non-root user
RUN addgroup -S app && adduser -S app -G app
USER app

# Copy requirements and install
COPY ./py_flash /app
WORKDIR /app
RUN pip install -r requirements.txt --upgrade

# Run app
ENTRYPOINT ["python"]
CMD ["app.py"]
