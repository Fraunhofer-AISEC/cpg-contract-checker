var BlockFinanceToken = artifacts.require("BlockFinanceToken.sol");





number of gift card vouchers
module.exports = async function (deployer) {
await deployer.deploy(BlockFinanceToken, 100000);
};
