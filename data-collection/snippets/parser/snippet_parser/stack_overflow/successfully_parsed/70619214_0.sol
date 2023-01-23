

pragma solidity >=0.7.0 <0.9.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol';

contract DEX {

    struct Token {
        string token;
        address contractAddress;
    }

    mapping(string => Token) public tokens;
    string[] public tokenLis;

    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function addToken(string memory token, address contractAddress) external {
        tokens[token] = Token(ticker,contractAddress);
        tokenLis.push(ticker);
    }

    function getTokenAddress(string memory token) external view returns(address moemory) {
       return tokens[token].contractAddress;
    }

    function sendToken(string memory token, address from , uint256 amount)
     external
      {

        IERC20(tokens[token].contractAddress).transferFrom(
            from,
            address(this),
            amount
        );


    }

}
