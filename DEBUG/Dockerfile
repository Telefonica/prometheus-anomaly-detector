# This Dockerfile allows you debug the code from VSCODE
# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

#Variables de entorno config Anomaly detection
ENV FLT_PROM_URL='http://thanos-querier:10902'
ENV FLT_RETRAINING_INTERVAL_MINUTES=15
ENV FLT_METRICS_LIST='http_requests_total'
ENV APP_FILE=app.py
ENV FLT_DATA_START_TIME=3d
ENV FLT_ROLLING_TRAINING_WINDOW_SIZE=15d
ENV FLT_PARALLELISM=10

# Install pip requirements
COPY requirements.txt .
RUN pip install --upgrade pip wheel
RUN pip install -r requirements.txt
RUN pip install pymeeus ujson korean-lunar-calendar hijri-converter ephem convertdate setuptools-git pystan==2.19.1.1 LunarCalendar holidays cmdstanpy
RUN pip install prophet

WORKDIR /app
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# Necesitamos poder hacer Get
EXPOSE 8080
# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "app.py"]
