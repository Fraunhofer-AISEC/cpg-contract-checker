contract TestContract {
    struct Buyer {
        bytes32 name;
        uint price;
    }

    mapping(address => Buyer) buyerInfo;
    Buyerp[] buyerInfoList; 

    function testFunc() {
        
        Buyer bb = buyerInfo[msg.sender];

        
        for(uint i = 0;i<buyerInfoList.length;i++) {
            if(buyerInfoList[i].address == msg.sender) {
                Buyer bb = buyerInfo[i];
            }
        }
        
        
    }
}
