# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set metadata
LABEL maintainer="your-email@example.com"
LABEL version="1.0.0"
LABEL description="Python Jenkins CI/CD Demo Application"

# Set working directory inside container
WORKDIR /app

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV APP_ENV=production

# Update package list and install any system dependencies if needed
RUN apt-get update && apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Display Python version information during build
RUN echo "=== Python Version Information ===" && \
    python3 --version && \
    python3 -c "import sys; print(f'Python {sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}')" && \
    python3 -c "import platform; print(f'Platform: {platform.python_version()}')" && \
    pip3 --version && \
    echo "=== End Python Info ==="

# Create a non-root user for security
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Copy requirements file (create if you have dependencies)
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY app.py .
COPY test_app.py .

# Create logs directory
RUN mkdir -p /app/logs

# Change ownership of app directory to appuser
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose port (if your app becomes a web service)
# EXPOSE 8000

# Health check to ensure container is healthy
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python3 -c "import app; print('Health check passed')" || exit 1

# Add volume for logs (optional)
VOLUME ["/app/logs"]

# Default command to run the application
CMD ["python3", "app.py"]

# Alternative commands you can use:
# CMD ["python3", "test_app.py"]  # To run tests
# CMD ["python3", "-m", "unittest", "test_app.py", "-v"]  # Verbose tests