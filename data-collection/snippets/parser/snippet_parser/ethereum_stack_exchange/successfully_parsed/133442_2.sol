
pragma solidity ^0.8.16;

contract ModuloRanging {

    uint constant public tokensCount = 10_000;
    uint public tokensProcessed = 0;
    uint public lastId;
    mapping(uint => bool) public mited;

    function handleGetTokenId() public returns(uint) {
        require(tokensProcessed >= tokensCount, "No more tokens left");

        
        
        
        uint id = (block.timestamp + tokensProcessed) % tokensCount;

        require(!mited[id], "Token already minted");

        tokensProcessed++;

        lastId = id;
        return id;
    }

}

