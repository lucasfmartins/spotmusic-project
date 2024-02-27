<div align="center">
  <h1>
    spotmusic-api
  </h1>

  > “Sistema monolito modular - SpotMusic”
</div>

Nome Externo: **spotmusic-api**

## Instalar e executar

### Virtualenv

- Se você optar por usar pyenv, ele deve ter pelo menos a versão 2.3.0:

- Seu pipenv deve ter pelo menos a versão 2021.5.29

- Crie um ambiente Python na versão 3.10.2 e ative-o.

Use estes códigos para verificar as versões:

    $ pipenv --version
    $ python --version
    $ pyenv --version

### Configurar o ambiente da aplicação

Copie e edite o arquivo .env conforme necessário.

    $ cp devtools/dotenv.dev .env

Lembre-se de configurar essas variáveis de ambiente em seu arquivo .env:

- USERNAME
- PASSWORD
- AUTH_CLIENT_TOKEN

### Instalar dependências

Execute os seguintes comandos para instalar as dependências:

    $ make requirements-dev

### Executar aplicação

Execute o seguinte comando para executar a aplicação em um ambiente de desenvolvimento:

    $ make run-dev

Execute o seguinte comando para executar a aplicação em um ambiente de produção:

    $ make run

### Documentação da API

O endereço base da API RESTful é [http://0.0.0.0:8000](http://0.0.0.0:8000)
e a documentação Swagger está em [http://0.0.0.0:8000/docs](http://0.0.0.0:8000/docs)


## Testes

### Testes Unitários

Execute o seguinte comando para executar todos os testes:

    $ make test

Execute o seguinte comando para executar o teste com nome correspondente, por exemplo:

    $ make test-matching test=test_should_music_test

### Configurações

Você deve ter o arquivo settings.json na pasta .vscode com esta configuração:

    {
        "python.testing.pytestArgs": [
            "tests"
        ],
        "python.testing.unittestEnabled": false,
        "python.testing.pytestEnabled": true
    }

## Debugagem

Crie, se ainda não tiver feito, a pasta .vscode e o arquivo launch.json dentro da pasta:

    {
        "version": "0.2.0",
        "configurations": [
            {
                "name": "FastApi",
                "type": "python",
                "request": "launch",
                "module": "uvicorn",
                "args": [
                    "app.main:app", "--reload",
                ],
                "jinja": true,
                "justMyCode": true
            }
        ]
    }

## Lint

Execute o seguinte comando para verificar o lint:

    $ make check-lint

Execute o seguinte comando para tentar corrigir o lint:

    $ make lint

## Segurança

Execute o seguinte comando para verificar vulnerabilidades de segurança nos pacotes:

    $ make safety
