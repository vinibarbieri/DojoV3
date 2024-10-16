async function main() {
    // Defina o contrato que será implantado
    const VotingContract = await ethers.getContractFactory("VotingContract");
  
    // Faça o deploy do contrato
    const votingContract = await VotingContract.deploy();
  
    await votingContract.deployed();
  
    console.log("VotingContract deployed to:", votingContract.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  