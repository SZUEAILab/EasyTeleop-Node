FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    MPLBACKEND=Agg

WORKDIR /app

COPY . /app/

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    libgl1 \
    libglib2.0-0 \
    libusb-1.0-0 \
    && rm -rf /var/lib/apt/lists/* 
RUN pip install --no-cache-dir --upgrade pip 
RUN pip install --no-cache-dir . 
RUN pip install --no-cache-dir git+https://github.com/SZUEAILab/EasyTeleop.git

CMD ["python", "node.py"]
