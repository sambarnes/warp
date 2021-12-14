/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.0",
  networks: {
    myNetwork: {
      url: "http://localhost:5000"
    }
  },
  cairo: {
    version: "0.6.2"
  },
};
require("@nomiclabs/hardhat-ethers");
require("@shardlabs/starknet-hardhat-plugin");