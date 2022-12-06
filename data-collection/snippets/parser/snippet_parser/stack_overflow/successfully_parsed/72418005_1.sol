contract Auction{
    constructor(address _owner, uint _bidIncrement, uint _startTime, uint _endTime, 
    uint _tokenId) {

        owner = _owner;
        bidIncrement = _bidIncrement;
        startTime = _startTime;
        endTime = _endTime;
        tokenId = _tokenId;
    }
} 
