# spotmusic-backoffice/Dockerfile

# Use a imagem oficial do Node.js
FROM node:16-alpine AS deps

# Configuração do diretório de trabalho
WORKDIR /app

# Copie o código-fonte para o diretório de trabalho
COPY ./src /App

# Instale as dependências
# RUN npm install

# Comando para iniciar a aplicação
CMD ["npm", "start"]