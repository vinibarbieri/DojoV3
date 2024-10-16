async function main() {
    const MessageBoard = await ethers.getContractFactory("MessageBoard");
    const messageBoard = await MessageBoard.deploy();
    await messageBoard.deployed();
    console.log("MessageBoard deployed to:", messageBoard.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
      console.error(error);
      process.exit(1);
  });
