FROM python:3.10-slim

# System dependencies
RUN apt update && apt install -y git && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /VJ-File-Store

# Copy requirements first (for caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . .

# Run bot
CMD ["python", "bot.py"]
