import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require('dotenv').config();


const config: HardhatUserConfig = {

  solidity: "0.8.28",
  defaultNetwork: "sepolia",
  networks: {
    hardhat: {

    },
    sepolia: {
      chainId: 11155111,
      url:`https://eth-sepolia.g.alchemy.com/${ALCHEMY_API_KEY}`,
      accounts:[WALLET]
    }
  
  } , paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
};

export default config;
