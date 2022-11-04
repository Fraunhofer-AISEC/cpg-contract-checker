contract Crowdsale {
    uint public startBlock;
    uint public endBlock;

    uint public constant PRICE = 400;

    Crowdsale(uint _startBlock, uint _endBlock) {
        require(block.number < _startBlock);
        require(_startBlock < _endBlock);
    }

    function buy() payable {
        require(block.number >= startBlock && block.number <= endBlock);
        require(msg.value > 0);
        
        int tokens = msg.value * PRICE;
        balance[msg.sender] += tokens;
    }
}
