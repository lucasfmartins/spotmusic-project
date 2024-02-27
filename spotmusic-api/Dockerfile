# SpotMusicApi/Dockerfile

FROM python:3.10 as base

# Configura ambiente env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

ARG SPOTMUSIC_USERNAME
ARG SPOTMUSIC_PASSWORD

FROM base AS runtime

# Configuração do diretório de trabalho
WORKDIR /app

# Copie o código-fonte para o diretório de trabalho
COPY ./app /app

# Instale as dependências
# RUN pip install --no-cache-dir -r requirements.txt

# Comando para iniciar a aplicação
CMD ["python", "main.py"]