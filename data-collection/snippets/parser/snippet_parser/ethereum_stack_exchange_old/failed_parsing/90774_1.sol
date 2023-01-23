/ contracts/SimpleToken.sol

pragma solidity ^0.5.5;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract SimpleToken is Context, ERC20, ERC20Detailed {
    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply
    ) public ERC20Detailed(name, symbol, 18) {
        _mint(_msgSender(), initialSupply);
    }
}



    pragma solidity ^0.5.5;
    
import "@openzeppelin/contracts/crowdsale/Crowdsale.sol";

contract SimpleCrowdsale is Crowdsale {
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token
    ) public Crowdsale(rate, wallet, token) {}
}



const SimpleToken = artifacts.require("SimpleToken");
const SimpleCrowdsale = artifacts.require("SimpleCrowdsale");

module.exports = async function (deployer, network, accounts) {
  await deployer.deploy(SimpleToken, 'Simple Token', 'SIM', '10000000000000000000000');
  const token = await SimpleToken.deployed();
  
  await deployer.deploy(SimpleCrowdsale, 1, accounts[0], token.address);
  const crowdsale = await SimpleCrowdsale.deployed();

  token.transfer(crowdsale.address, await token.totalSupply())
};
