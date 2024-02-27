
<div align="center">
  <h1>
    spotmusic-web
  </h1>

  > “Sistema frontend web - SpotMusic”
</div>


## Instalação do Ambiente

Primeiramente, instale o [NVM](https://github.com/nvm-sh/nvm) e instale a versão específica do Node via terminal:

```bash
nvm install v16
```


```bash
yarn npm login --scope spotmusic
```
Utilize o seu username utilizado,

Instale todas as dependências:

```bash
yarn
```

Crie seu arquivo `.env` local:

```bash
cp .env.sample .env
```

e então, suba a aplicação:

```bash
yarn run dev
yarn run dev:debug
```

## Rodando os testes

### Testes Unitários

- `npm run test` - rodar todos os testes unitários através do jest
- `npm run test:watch` - iniciar jest watch e filtrar testes que foram alterados
- `npm run test:coverage` - rodar testes e gerar o coverage do jest
- `npm run test:badges` - rodar testes e gerar coverage badges
- `npm run test:ci` - rodar todos os testes em ambienteInspecionar código localmente usando

You can also run your test by modules, like:

- `yarn test:web --watch` - run all me-web test
- `yarn test:server --watch` - run all me-server test
- `yarn test:ci --watch` - run all ci test

To run Sonar Qube validation locally first run db and sonarqube services via docker-compose:

```bash
docker-compose up -d --build db sonarqube
```

Then just run the sonar script:

```bash
npm run sonar
```

and access [http://localhost:9000](http://localhost:9000) with credentials to see the project metrics:

```
    user: admin
    pass: admin
```

## Lint
Para automaticamente checar e corrigir estilo e formatação no codigo.

- `yarn lint --fix`
