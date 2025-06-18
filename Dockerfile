# Use Python 3.11 for ntgcalls compatibility
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies (especially for opencv & audio)
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libsm6 \
    libxext6 \
    libx11-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy only requirements first
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir --upgrade -r requirements.txt

# Copy rest of the project
COPY . .

# Set entrypoint
CMD ["python", "bot.py"]
