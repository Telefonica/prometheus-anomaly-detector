FROM python:3.8.12

WORKDIR /app
COPY requirements.txt .

# RUN apk update && \
#     apk add gcc

RUN pip install --upgrade pip wheel

RUN pip install -r requirements.txt
RUN pip install pymeeus ujson korean-lunar-calendar hijri-converter ephem convertdate setuptools-git pystan==2.19.1.1 LunarCalendar holidays cmdstanpy
RUN pip install prophet

COPY *.py /app/

CMD [ "python", "/app/app.py" ]
