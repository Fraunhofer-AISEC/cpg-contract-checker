function createSmartGift(address _recipient, uint32 _expiry, string _donorMsg) public payable returns(address){
        address newGift;
        newGift = new SmartGift(_recipient, msg.sender, _expiry, _donorMsg);
        giftExists[newGift] = true;  

        uint id = gifts.push(Gift(newGift, _donorMsg,false, _expiry));
        giftToOwner[id-1] = _recipient;
        recipientGiftCount[_recipient]++;
        donorGiftCount[msg.sender]++;

        newGift.transfer(address(this).balance); 

        return newGift;
    }
