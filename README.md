# Simple Super App

[![Platforms][platforms-shield]][platforms-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

Proposta de implementação modular de um super app SwiftUI.

![demo](https://github.com/lfsilva/simplesuperapp/blob/main/docs/imgs/demo.gif)

## Key Features

* Aplicativo modular
* Mdódulo de injeção de dependências
* Mdódulo de rede
* Mdódulo de busca de filme
* Swift Concurrency

## How To Use

Descrição de como executar o projeto.

### Configurar as chaves do projeto

Criar o arquivo `app/.env` com o seguinte conteúdo:

```bash
// API ACCESS
API_HOST = streaming-availability.p.rapidapi.com
API_KEY = 1234
```

Onde `API_KEY` é a chave de autorização da API que pode ser obtida em https://rapidapi.com/developer/authorization.

## To do

* Macro para injeção de dependência com `@Inject`
* Ativar strict concurrency do Swift 6
* Delegate de URLSession para autenticação
* Módulo de navegação
* Módulo de detalhe do filme
* Criação de mini apps nos módulos 

## Author

Leandro Fernandes, lfsilva@me.com

## License

MIT

<!-- markdown reference style and links -->
[platforms-shield]: https://img.shields.io/badge/Platforms-iOS-4E4E4E.svg?colorA=28a745
[platforms-url]: #how-to-use
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-blue.svg
[linkedin-url]: https://www.linkedin.com/in/lsilvabr/