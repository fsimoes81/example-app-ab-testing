FROM python:3.8.15-slim

EXPOSE 8501

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/fsimoes81/example-app-ab-testing.git .

RUN pip3 install -r requirements.txt

ENTRYPOINT ["streamlit", "run"]

CMD [ "./app_ab_testing/streamlit_app.py", "--server.port=8501", "--server.address=0.0.0.0"]