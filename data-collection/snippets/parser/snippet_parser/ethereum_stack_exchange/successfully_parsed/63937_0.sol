pragma solidity ^0.4.24;

import "../node_modules/openzeppelin- solidity/contracts/token/ERC20/ERC20.sol";  
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";
import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";


  
contract EventToken is ERC20, ERC20Detailed, ERC20Mintable, ERC20Burnable {

uint256 ticketExpiryDateTimestamp;

constructor(
    uint256 _initialSupply,
    string memory _name,
    string memory _symbol,
    uint8 _decimals,
    uint256 _ticketExpiryDateTimestamp
    )  
        ERC20Detailed(_name, _symbol, _decimals)
        ERC20Mintable()
        ERC20Burnable()
        ERC20()
        public
{
    mint(msg.sender, _initialSupply);
    ticketExpiryDateTimestamp = _ticketExpiryDateTimestamp;
}

function totalSupply() public view returns(uint256) {
    if(now > ticketExpiryDateTimestamp) {
        return 0;
    } else {
        return ERC20.totalSupply();
    }
}

function balanceOf(address owner) public view returns (uint256) {
    if(now > ticketExpiryDateTimestamp) {
        return 0;
    } else {
        return ERC20.balanceOf(owner);
    }
}

function allowance(address owner, address spender) public view returns(uint256) {
    if(now > ticketExpiryDateTimestamp) {
        return 0;
    } else {
        return ERC20.allowance(owner, spender);
    }
}

function transfer(address to, uint256 value) public returns(bool) {
    if(now > ticketExpiryDateTimestamp) {
        return false;
    } else {
        return ERC20.transfer(to, value);
    }
}

function approve(address spender, uint256 value) public returns (bool) {
    if(now > ticketExpiryDateTimestamp) {
        return false;
    } else {
        return ERC20.approve(spender, value);
    }
}

function transferFrom(address from, address to, uint256 value) public returns(bool) {
    if(now > ticketExpiryDateTimestamp) {
        return false;
    } else {
        return ERC20.transferFrom(from, to, value);
    }
}
}
