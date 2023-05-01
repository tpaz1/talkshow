# first builder
FROM python:3.6.15-bullseye

WORKDIR /app

ARG USERNAME

COPY . .

RUN pip install -e '.[dev]' && pip install email_validator

RUN flask adduser -u ${USERNAME} -p 1234
RUN flask addevent -n "Flask Conf" -d "2018-08-25" 

ENTRYPOINT [ "flask", "run" ]
# second test

# third serve