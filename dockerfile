# use a lightweight base image
FROM python:3.9-slim

# set environment variables to prevent python from writing  .pyc files and buffer output
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# set the working directory inside the container
WORKDIR /app
 
# copy only the required files
COPY requirements.txt /app/
COPY app.py /app/
COPY templates /app/templates
COPY static /app/static

# install the python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# expose the port where app runs on
EXPOSE 5000

# run the application
CMD ["python", "app.py"]