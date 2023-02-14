    uint[] tokens;
    uint randomNumber = RandomNumberContract.randomResult();
    function handleGetTokenId(uint _tokenOffset) public onlyOwner returns(uint) {
        require(tokens.length > 0, "No more tokens left");

        
        uint randomIndex = uint(keccak256(abi.encode(randomNumber, _tokenOffset))) % tokens.length;

        
        uint randomId = tokens[randomIndex];

        require(!_exists(randomId), "token already minted");

        
        tokens[randomIndex] = tokens[tokens.length - 1];
        
        tokens.pop();

        return randomId;
    }
