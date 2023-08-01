import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "@nomicfoundation/hardhat-foundry";

require("@nomicfoundation/hardhat-foundry");
const importToml = require('import-toml')
const foundryConfig = importToml.sync('foundry.toml')

const config: HardhatUserConfig = {
  solidity: {
    version: foundryConfig.profile.default.solc_version,
    settings: {
      optimizer: {
        enabled: true,
        runs: foundryConfig.profile.default.optimizer_runs,
      },
      metadata: {
        // do not include the metadata hash, since this is machine dependent
        // and we want all generated code to be deterministic
        // https://docs.soliditylang.org/en/v0.8.19/metadata.html
        bytecodeHash: 'none',
      },
    },
  },
};

export default config;
