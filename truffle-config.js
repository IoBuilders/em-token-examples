const HDWalletProvider = require('truffle-hdwallet-provider');

// to read the private key from a file
// const fs = require('fs');
// const PRIVATE_KEY = fs.readFileSync(".secret").toString().trim();

const PRIVATE_KEY = '0x46c91f8984ef0bc61ceb37b45d1ec19a67cebda540263109ee3352392f01e823';
const TELSIUS_URL = 'https://telsius.io.builders:22000';

const TELSIUS_PROVIDER = new HDWalletProvider(PRIVATE_KEY, TELSIUS_URL);

module.exports = {
  networks: {
    telsius: {
      provider: TELSIUS_PROVIDER,
      network_id: "83584648538",
      gas: 8000000,
      gasPrice: 0,
      type: "quorum",
    },
  },

  compilers: {
    solc: {
      version: "0.5.16",
      settings: {
       optimizer: {
         enabled: false,
         runs: 200
       },
      },
      evmVersion: "byzantium"
    }
  }
}
