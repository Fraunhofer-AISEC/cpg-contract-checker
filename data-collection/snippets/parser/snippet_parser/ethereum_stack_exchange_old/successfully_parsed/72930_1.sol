PresaleCrowdsale.sol

pragma solidity 0.5.0;

import "../client/node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "../client/node_modules/openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "../client/node_modules/openzeppelin-solidity/contracts/crowdsale/validation/WhitelistCrowdsale.sol";
import "../client/node_modules/openzeppelin-solidity/contracts/crowdsale/emission/AllowanceCrowdsale.sol";

contract PresaleCrowdsale is WhitelistCrowdsale, AllowanceCrowdsale{
    constructor(uint256 _rate, address payable _wallet, ERC20 _token, address _tokenWallet)
    Crowdsale(_rate, _wallet, _token)
    AllowanceCrowdsale(_tokenWallet)
    public {  }
}
