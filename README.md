# Web3 Message Board DApp

Este projeto é um **DApp (Decentralized Application)** desenvolvido para demonstrar a interatividade entre usuários e a blockchain, onde eles podem enviar e atualizar uma mensagem que fica armazenada em um contrato inteligente. A interface utiliza **Three.js** para exibir o conteúdo de forma visualmente atraente, e a funcionalidade principal é alimentada por um contrato inteligente escrito em **Solidity**.

## Funcionalidades

- **Conexão com MetaMask**: Os usuários podem conectar suas carteiras Ethereum usando MetaMask para interagir com o DApp.
- **Envio de Mensagens**: Os usuários podem enviar uma nova mensagem, que é gravada na blockchain por meio de um contrato inteligente.
- **Recuperação de Mensagens**: A mensagem armazenada no blockchain é recuperada e exibida no painel interativo.
- **Interface Gráfica Dinâmica**: A interface inclui um painel de mensagens com efeitos visuais em neon, criados com **Three.js**, para uma experiência imersiva.

## Tecnologias Utilizadas

- **Solidity**: Linguagem de programação utilizada para o desenvolvimento do contrato inteligente que armazena as mensagens.
- **Web3.js**: Biblioteca JavaScript usada para interagir com a blockchain e o contrato inteligente.
- **Three.js**: Utilizado para renderizar gráficos em 3D e aplicar os efeitos visuais no painel de mensagens.
- **MetaMask**: Wallet de Ethereum que facilita a conexão do usuário com o DApp.
- **HTML, CSS e JavaScript**: Ferramentas de front-end usadas para criar a interface e a funcionalidade do DApp.

## Estrutura do Projeto

O projeto é dividido em três principais arquivos:

1. **index.html**: Página principal que contém o layout da interface do DApp, incluindo os campos de input, botão de envio de mensagem, e a área de renderização gráfica com Three.js.
2. **app.js**: Script responsável pela interação entre o front-end e a blockchain, utilizando Web3.js para enviar e recuperar mensagens do contrato inteligente.
3. **messageBoard.sol**: Contrato inteligente em Solidity que armazena a mensagem enviada pelo usuário e permite sua recuperação.

## Como Executar o Projeto

### Pré-requisitos

1. **MetaMask** instalada no seu navegador.
2. **Node.js** e npm instalados.
3. Acesso à rede Ethereum (pode ser uma testnet como a Polygon Amoy Testnet).

### Instalação

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/message-board-dapp.git
   ```

2. Navegue até a pasta do projeto:
   ```bash
   cd message-board-dapp
   ```

3. Instale as dependências necessárias:
   ```bash
   npm install
   ```

### Execução

1. Certifique-se de que você está conectado à sua MetaMask e à rede Ethereum que está usando.
2. Abra o arquivo **index.html** em seu navegador.
3. Interaja com o DApp enviando e atualizando mensagens.

### Contrato Inteligente

O contrato inteligente usado neste projeto está localizado em `messageBoard.sol`. Ele é responsável por:

- Armazenar a mensagem enviada pelo usuário.
- Retornar a mensagem armazenada quando solicitada.

### Deploy do Contrato

Para fazer o deploy do contrato em uma rede Ethereum:

1. Compile e faça o deploy utilizando ferramentas como **Remix** ou **Hardhat**.
2. Copie o endereço do contrato e atualize o valor da constante `CONTRACT_ADDRESS` no arquivo **app.js**.

## Contribuições

Fique à vontade para abrir issues ou pull requests com sugestões, melhorias ou correções!

## Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo `LICENSE` para mais detalhes.
