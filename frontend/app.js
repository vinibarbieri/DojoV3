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

// Função para conectar a carteira e atualizar a mensagem assim que carregar a página
window.addEventListener('load', async () => {
  if (window.ethereum) {
    // Conecta a carteira MetaMask
    window.web3 = new Web3(window.ethereum);
    await window.ethereum.enable();
    
    // Carrega o contrato e a conta do usuário
    const contract = new window.web3.eth.Contract(ABI, CONTRACT_ADDRESS);
    const accounts = await window.web3.eth.getAccounts();
    const userAccount = accounts[0];
    
    const messageInput = document.getElementById('message-input');
    const setMessageButton = document.getElementById('set-message-button');
    
    async function loadMessage() {
      try {
        const message = await contract.methods.getMessage().call();
        updateTextTexture(message);  // Atualiza a mensagem no painel usando o canvas
      } catch (error) {
        console.error(error);
      }
    }

    async function setMessage() {
      const newMessage = messageInput.value;
      if (newMessage) {
        setMessageButton.innerHTML = 'Sending...';
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
          setMessageButton.innerHTML = 'Update message';
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
