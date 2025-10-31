# ===== Multi-stage build for a smaller, secure image =====
FROM python:3.12-slim AS build

WORKDIR /app
COPY app/ /app/

# Install dependencies into a temporary directory
RUN pip install --no-cache-dir --target=/app/deps flask gunicorn boto3

# ===== Final image =====
FROM python:3.12-slim

WORKDIR /app
COPY --from=build /app /app

# Add dependencies to Python path
ENV PYTHONPATH=/app/deps

# Create non-root user for security
RUN useradd -m appuser
USER appuser

EXPOSE 5000

# Start the app using gunicorn (no need to change directory)
CMD ["python3", "-m", "gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
