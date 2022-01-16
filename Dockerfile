FROM python:3.9.9-slim AS base-compiler

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

##########################################################

FROM base-compiler AS final

COPY ./app /app

EXPOSE 8000

# ENTRYPOINT ["python", "app.py"]
CMD ["uvicorn", "app.microservice:app", "--host", "0.0.0.0", "--port", "8000"]