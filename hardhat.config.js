require("@nomiclabs/hardhat-ethers");
require("dotenv").config();


module.exports = {
  solidity: "0.8.27",
  networks: {
    amoy: {
      url: "https://polygon-amoy.drpc.org",
      chainId: 80002, 
      accounts: [process.env.PRIVATE_KEY]
    }
  }
};
