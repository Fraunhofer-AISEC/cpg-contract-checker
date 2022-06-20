abstract contract Aion {
    uint256 public serviceFee;
    function ScheduleCall(uint256 blocknumber, address to, uint256 value, uint256 gaslimit, uint256 gasprice, bytes memory data, bool schedType) virtual public payable returns (uint,address);
}

contract CardAuction is CardOwnership {

    Aion aion;

    function createCardAuction(uint _cardId, uint _startingBid, uint _duration) external checkAuctionDuration(_duration) onlyCardOwner(_cardId) {
        require(!cardIsForSale[_cardId], 'CARD ALREADY UP FOR AUCTION');
        aion = Aion(0xFcFB45679539667f7ed55FA59A15c8Cad73d9a4E);
        bytes memory data = abi.encodeWithSelector(bytes4(keccak256('endAuction(uint)')), _cardId);
        uint callCost = 500000*1e9 + aion.serviceFee();
        aion.ScheduleCall{value: callCost}(block.timestamp + _duration, address(this), 0, 500000, 1e9, data, true);        

        cardIsForSale[_cardId] = true;
        cardToCurrentBid[_cardId] = _startingBid;
        auctionExpireDate[_cardId] = block.timestamp + _duration;
        
        AuctionOpened(auctionId, _cardId, _startingBid, block.timestamp + _duration, msg.sender);
    }
}