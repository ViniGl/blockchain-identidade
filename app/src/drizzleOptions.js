import Web3 from "web3";
import Bank from "./contracts/Bank.json";

const options = {
  web3: {
    block: false,
    customProvider: new Web3("ws://localhost:7545"),
  },
  contracts: [Bank],
};

export default options;
