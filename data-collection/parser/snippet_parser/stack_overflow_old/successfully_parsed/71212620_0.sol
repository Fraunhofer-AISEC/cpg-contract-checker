
pragma solidity >=0.5.0 <6.0;

import "node_modules/@openzeppelin/contracts/crowdsale/Crowdsale.sol";
import "./myToken.sol";

contract CrowdSale{
    address payable admin;
    myToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);

    constructor (myToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
    }
}