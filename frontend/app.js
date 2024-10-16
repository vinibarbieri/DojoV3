const CONTRACT_ADDRESS = '0x938a90c60Bc3995b46b5477f2892381Cd18fDfB3';
const ABI = [ {
    "inputs": [],
    "name": "getMessage",
    "outputs": [
      {
        "internalType": "string",
        "name": "",
        "type": "string"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "string",
        "name": "_message",
        "type": "string"
      }
    ],
    "name": "setMessage",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  } ];

window.addEventListener('load', async () => {
  if (window.ethereum) {
    window.web3 = new Web3(window.ethereum);
    await window.ethereum.enable();
    
    const contract = new window.web3.eth.Contract(ABI, CONTRACT_ADDRESS);
    const accounts = await window.web3.eth.getAccounts();
    const userAccount = accounts[0];
    
    const messageBoard = document.getElementById('message-board');
    const messageInput = document.getElementById('message-input');
    const setMessageButton = document.getElementById('set-message-button');
    
    async function loadMessage() {
      try {
        const message = await contract.methods.getMessage().call();
        messageBoard.innerText = message;
      } catch (error) {
        messageBoard.innerText = 'Erro ao carregar a mensagem.';
        console.error(error);
      }
    }

    async function setMessage() {
      const newMessage = messageInput.value;
      if (newMessage) {
        setMessageButton.innerHTML = 'Enviando...';
        setMessageButton.disabled = true;

        await new Promise(resolve => setTimeout(resolve, 1000));
        
        try {
          await contract.methods.setMessage(newMessage).send({ from: userAccount });
          messageInput.value = '';
          loadMessage();
        } catch (error) {
          console.error(error);
          alert('Erro ao enviar a mensagem. Verifique o console para mais detalhes.');
        } finally {
          setMessageButton.innerHTML = 'Alterar Mensagem';
          setMessageButton.disabled = false;
        }
      } else {
        alert("Por favor, insira uma mensagem.");
      }
    }

    setMessageButton.addEventListener('click', setMessage);
    loadMessage();
  } else {
    alert('Por favor, instale uma carteira como MetaMask para interagir com este DApp.');
  }
});
