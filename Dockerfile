# lightweight python image
FROM python:3.9-slim

WORKDIR /app

# keep pip cache out of image
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy app
COPY . .

# expose port Flask uses
EXPOSE 5000

# start the app
CMD ["python", "app.py"]
