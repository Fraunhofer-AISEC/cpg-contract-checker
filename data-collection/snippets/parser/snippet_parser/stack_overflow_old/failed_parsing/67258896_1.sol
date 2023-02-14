  function sendViaCallWValue(address payable _to,uint money) public payable {
        (bool sent, bytes memory data) = _to.call.value(money)("");
        require(sent, "faild to send Ether");
    }

function payBill(uint billId, uint amt) public payable returns(uint times){
        uint amountTaken ;
        uint percentagePbs ;
        uint share;
        uint x = 0;
        for(uint i=0; i <= nextBillId; i++){
            if(Bills[i].id == billId){
            for(uint c=0; c <= nextCollabId; c++){
                if(Collabs[c].songId == Bills[i].songId){
                    percentagePbs = Collabs[c].percentage * 100;
                    share = amt * percentagePbs / 10000;
                    amountTaken = amountTaken + share;
                    address payable  addr = Collabs[c].ArtistAddress;
                    sendViaCallWValue(addr,share);
                    }
                }
            }
        
