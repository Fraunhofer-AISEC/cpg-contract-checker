function initiateBid(uint _itemId, uint _endTime) public itemOwner{
require(msg.sender == itemToOwnerMapping[_itemId]);
itemToBiddingMap[_itemId] = biddingData(_endTime, 0, msg.sender,  true);}
