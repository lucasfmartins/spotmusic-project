# SpotMusicApi/Dockerfile

FROM python:3.10 as base

# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

# This limits the objects in the runtime image to only those needed
FROM base AS python-deps

# Install pipenv and compilation dependencies
RUN pip install --upgrade pip setuptools wheel
RUN pip install pipenv="==2022.10.25"
RUN apt-get update && apt-get install -y --no-install-recommends gcc

# Copy files to install dependencies
COPY Pipfile .
COPY Pipfile.lock .

# Setup env
ARG SPOTMUSIC_USERNAME
ARG SPOTMUSIC_PASSWORD

# Install python dependencies in /.venv
RUN PIPENV_VENV_IN_PROJECT=1 pipenv install --deploy

# Build runtime image
FROM base AS runtime

# Configuração do diretório de trabalho
WORKDIR /app

# Copie o código-fonte para o diretório de trabalho
COPY ./app /app

# Instale as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Comando para iniciar a aplicação
CMD ["python", "main.py"]