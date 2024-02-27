# spotmusic-api

External name: **spotmusic-api**

## Install and run

### Virtualenv

- If you choose to use pyenv it must be at least version 2.3.0:

- Your pipenv must be at least version 2021.5.29

- Create a Python version 3.10.2 environment and activate it.

Use these codes to check versions:

    $ pipenv --version
    $ python --version
    $ pyenv --version

### Configure the application environment

Copy and edit the .env file as needed.

    $ cp devtools/dotenv.dev .env

Remember to set these envs in your .env file:

- USERNAME
- PASSWORD
- AUTH_CLIENT_TOKEN

### Install dependencies

Execute the following commands to install dependencies:

    $ make requirements-dev

### Run application

Execute the following command to run the application in a development environment:

    $ make run-dev

Execute the following command to run the application in a production environment:

    $ make run

### Api documentation

The base address of RESTful API is [http://0.0.0.0:8000](http://0.0.0.0:8000)
and Swagger documentation is [http://0.0.0.0:8000/docs](http://0.0.0.0:8000/docs)

## Outdated packages

Execute the following command to list outdated packages:

    $ make outdated

## Testing

### Unit tests

Execute the following command to run all tests:

    $ make test

Execute the following command to run test with name match, example:

    $ make test-matching test=test_should_order_rest

### Settings

You must have settings.json file in .vscode folder with this configuration:

    {
        "python.testing.pytestArgs": [
            "tests"
        ],
        "python.testing.unittestEnabled": false,
        "python.testing.pytestEnabled": true
    }

## Debugging

Create, if you haven't already done so, the .vscode folder and launc.json file inside the folder:

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

Execute the following command to check lint:

    $ make check-lint

Execute the following command to try fix lint:

    $ make lint

## Security

Execute the following command to check security vulnerabilities in packages:

    $ make safety
