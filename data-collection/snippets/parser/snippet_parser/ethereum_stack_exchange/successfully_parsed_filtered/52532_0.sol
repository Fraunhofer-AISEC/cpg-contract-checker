pragma solidity ^0.4.24;


import {StandardToken as StandardERC20} from "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import {ERC721Token as StandardERC721} from "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol";

contract ERC20Token is StandardERC20 {
    string public name;
    string public symbol;
    uint8 public decimals;

    constructor(string _name, string _symbol, uint8 _decimals) public {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
    }
}

contract ERC721Token is StandardERC721 {
    constructor(string _name, string _symbol)
    public
    StandardERC721(_name, _symbol)
    {
    }
}

contract TokenFactory {
    
    function newERC20(string _name, string _symbol, uint8 _decimals) public {
        emit ERC20Created(new ERC20Token(_name, _symbol, _decimals), _name, _symbol, _decimals);
    }

    
    function newERC721(string _name, string _symbol) public {
        emit ERC721Created(new ERC721Token(_name, _symbol), _name, _symbol);
    }

    event ERC20Created(ERC20Token indexed tokenAddress, string indexed name, string indexed symbol, uint8 decimals);
    event ERC721Created(ERC721Token tokenAddress, string name, string symbol);
}
