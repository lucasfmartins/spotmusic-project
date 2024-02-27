<div align="center">
  <h1>
    spotmusic-backoffice
  </h1>

  > “Sistema de administração e configuração do portal SpotMusic”
</div>

## Instalação do Ambiente

Primeiramente, instale o [NVM](https://github.com/nvm-sh/nvm) e instale a versão **14.17.0** do Node com o comando:

```bash
nvm install v14.17.0
```

crie um arquivo `.env` local:

```bash
cp ./devtools/.env.dev .env
```

instale todas as dependências do projeto:

```bash
npm install
```

e então, suba a aplicação:

```bash
npm run dev
```