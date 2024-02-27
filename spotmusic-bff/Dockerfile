# spotmusic-web/Dockerfile

# Use a imagem oficial do Node.js
FROM node:16-alpine AS deps

# Configuração do diretório de trabalho
RUN apk add --no-cache libc6-compat
WORKDIR /app

# Copie o código-fonte para o diretório de trabalho
COPY ./src /app

# Instale as dependências
RUN npm install

# Inicia a aplicação
CMD ["npm", "start"]