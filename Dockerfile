FROM python:3.12-slim 
#python image, easier to pull
WORKDIR /app
#setting working directory inside the container
COPY app/requirements.txt .
RUN pip install -r requirements.txt
#copy and run requirements first always
COPY app/ .
#copy the actual app
EXPOSE 5000
#this is documentation for developers
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
#command to run when the container starts
#gunicorn : web server
#--bind, 0.0.0.0:5000 -- listen to all interfaces on port 5000
#in the file app.py find object app