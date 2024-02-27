# spotmusic-web/Dockerfile

# Use a imagem oficial do Node.js
FROM node:16-alpine AS deps

RUN apk add --no-cache libc6-compat

# Configuração do diretório de trabalho
WORKDIR /app

# Copie o código-fonte para o diretório de trabalho
COPY ./src /app

# Instale as dependências
RUN npm install

# Comando para iniciar a aplicação
CMD ["npm", "start"]