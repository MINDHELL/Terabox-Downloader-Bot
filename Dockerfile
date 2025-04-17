FROM hrishi2861/terabox:latest

WORKDIR /app

# Install aria2
RUN apt update && apt install -y aria2

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["bash", "start.sh"]
