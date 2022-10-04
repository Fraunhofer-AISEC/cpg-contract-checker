pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.3.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.3.0/contracts/token/ERC20/ERC20Detailed.sol";


contract Token is ERC20, ERC20Detailed {

    constructor (string memory name, string memory symbol, uint8 decimals, uint256 totalSupply) 
        public 
        ERC20Detailed(name, symbol, decimals) 
    {
        _mint(msg.sender, totalSupply);
    }
}

contract Factory {
    struct tokenData { 
        string name; 
        string symbol; 
        uint8 decimals; 
        uint256 totalSupply;  
    } 

    event TokenCreated(address indexed tokenAddress, string name, string symbol, uint8 decimals, uint256 totalSupply);

    mapping(address => tokenData) private _tokens;

    function createToken(string memory name, string memory symbol, uint8 decimals, uint256 totalSupply) public returns(address tokenAddress){ 
        Token token = new Token(name, symbol, decimals, totalSupply);
        _tokens[address(token)] = tokenData(name, symbol, decimals, totalSupply);

        emit TokenCreated(address(token), name, symbol, decimals, totalSupply);

        return(address(token));
    } 

    function getTokenData(address tokenAddress) public view returns(string memory name, string memory symbol, uint8 decimals, uint256 totalSupply){
        return (_tokens[tokenAddress].name, _tokens[tokenAddress].symbol, _tokens[tokenAddress].decimals, _tokens[tokenAddress].totalSupply);
    }
}
