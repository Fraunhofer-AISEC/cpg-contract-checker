pragma solidity ^0.4.17;

interface Token {
    function approve(address spender, uint256 value) public returns (bool);
    function transferFrom(address from, address to, uint256 value) public returns (bool);   
}



contract TrxCoin {

    Token token = Token(0xAc08fe3C9F442990C52904dE997D9972499bD3E6);

    function getContractAddr() view public returns (address) {
        return this;
    }

    function approve(address spender, uint256 value) public {
        require(token.approve(spender, value));
    }

    function transfer(address _to, uint value) public payable {
        require(token.transferFrom(msg.sender, _to, value));
    }
}
