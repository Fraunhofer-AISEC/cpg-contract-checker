pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract claimTest {

    ERC20 public token;
    ERC20 public token2;
    address private tokenAddress;
    uint private fixedAmount;

    constructor () {
    }

    function setToken(ERC20 _token) public {
        token = _token;
    }

    function setAddress(address _address) public {
        tokenAddress = _address;
        token2 = ERC20(_address);
     }

    
    
    function claim() public {
        token._mint(msg.sender, fixedAmount);
    }

    
    function totalSupply()  public view returns (uint) {
        return token.totalSupply();
    }

}
