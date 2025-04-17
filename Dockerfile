FROM hrishi2861/terabox:latest
WORKDIR /app
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["bash", "start.sh"]
