require("@nomiclabs/hardhat-waffle");

const fs = require("fs")
const privateKey = fs.readFileSync(".secret").toString()
const projectId = "bd4636a7719a4fedbaaed864de994d11"

module.exports = {
  networks: {
    hardhat: {
      chainId: 1337
    },
    numbai: {
      url: "https://polygon-mumbai.infura.io/v3/${projectId}",
      accounts: []
    },
    mainnet:{
      url: "https://polygon-mainnet.infura.io/v3/${projectId}",
      accounts: []
    }
  },
  solidity: "0.8.4",
}
