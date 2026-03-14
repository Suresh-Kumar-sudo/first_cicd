FROM python:latest 

WORKDIR /app

COPY requirements.txt /app/
COPY devops/ /app/

SHELL ["/bin/bash","-c"]


RUN apt-get update && \
python3 -m venv venv1 && \
source venv1/bin/activate && \
pip install --no-cache-dir -r requirements.txt


ENV PATH="/app/venv1/bin:$PATH"

EXPOSE 8000

CMD python3 manage.py runserver 0.0.0.0:8000


