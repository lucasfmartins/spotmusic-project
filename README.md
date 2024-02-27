# SpotMusic

Este repositório é o monorepo central da plataforma SpotMusic, que reúne tanto os projetos web quanto mobile.

### spotmusic-web

- **Descrição:** Aplicação web em ReactJS.
- **Tecnologias:** ReactJS, NodeJS
- **Instruções de Instalação e Uso:** Consulte o [readme.md em spotmusic-web](spotmusic-web/README.md).

### spotmusic-mobile

- **Descrição:** Aplicação mobile feita em ReactNative, um player de música utilizado pelos clientes da SpotMusic.
- **Tecnologias:** ReactNative.
- **Instruções de Instalação e Uso:** Consulte o [readme.md em spotmusic-mobile](spotmusic-mobile/README.md).

### spotmusic-backoffice

- **Descrição:** Aplicação web em ReactJS.
- **Tecnologias:** ReactJS.
- **Instruções de Instalação e Uso:** Consulte o [readme.md em spotmusic-backoffice](spotmusic-backoffice/README.md).

### spotmusic-api

- **Descrição:** Uma API web em Python com FastAPI para o backend de aplicações SpotMusic.
- **Tecnologias:** Python, FastAPI.
- **Instruções de Instalação e Uso:** Consulte o [readme.md em spotmusic-api](spotmusic-api/README.md).


## **Ambiente de desenvolvimento**

### Configuração de Docker

Cada projeto possui um arquivo Dockerfile para facilitar a criação de containers.

### Configuração Terraform

O diretório [terraform/](terraform/) contém os arquivos necessários para a configuração do Terraform.

Para mais informações específicas de cada projeto, consulte os respectivos arquivos readme.md nas pastas dos projetos.

## **Executando o Ambiente com Docker Compose**

Certifique-se de ter o Docker e o Docker Compose instalados em sua máquina.

1. Clone o repositório:

   ```bash
   git clone https://github.com/seu-usuario/spotmusic-project.git
   ```

2. Crie um arquivo `.env` na raiz do projeto e configure as variáveis de ambiente necessárias, se aplicável.

3. Execute o seguinte comando para iniciar todos os projetos:

   ```bash
   docker-compose up -d
   ```

4. Acesse os projetos nas seguintes URLs:

   - spotmusic-api: [http://localhost:5000](http://localhost:5000)
   - spotmusic-web: [http://localhost:3000](http://localhost:3000)

Certifique-se de ajustar as portas e URLs conforme necessário, dependendo das configurações do seu projeto. Essas são apenas instruções básicas, e você pode personalizar conforme a complexidade do seu ambiente.
