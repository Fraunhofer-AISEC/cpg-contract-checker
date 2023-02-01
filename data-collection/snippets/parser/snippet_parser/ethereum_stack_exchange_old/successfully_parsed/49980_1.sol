pragma solidity ^0.4.16;

contract ERC20 {
function totalSupply() constant returns (uint256 totalSupply);
function balanceOf(address _owner) constant returns (uint256 balance);
function transfer(address _to, uint _value);
event Transfer(address indexed _from, address indexed _to, uint _value);
}

contract TokenChecker {
address private senderAddress;
address private tokenAddress;

constructor(address _tokenAddress) public {
    senderAddress = msg.sender;
    tokenAddress = _tokenAddress;
}

function bal(address _address) public constant returns (uint256 balance) {
    ERC20 token = ERC20(tokenAddress);
    return token.balanceOf(_address);
}

function getThis() public constant returns (address thisAddress) {
    return address(this);
}

function tokenAdrs() public constant returns (address adrs) {
    return tokenAddress;
}

function () public payable {
    revert();
}
}
