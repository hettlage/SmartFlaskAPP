FROM python:3.10-slim-buster
WORKDIR /smartapp
COPY . /smartapp
RUN python -m pip install --no-cache-dir -r requirements.txt
CMD ["python", "run.py"]
