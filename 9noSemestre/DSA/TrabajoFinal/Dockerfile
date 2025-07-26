FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x /entrypoint.sh

RUN mkdir -p /app/config
RUN mkdir -p /app/data && chmod 755 /app/data

EXPOSE 8888

CMD [ "/entrypoint.sh" ]
