uint threshold = 1 ether;
uint percentage = 5;

function buy(uint minPurchaseReturn) public payable {
    ...
    if(msg.value > threshold){
        
        
        
        uint myPrecious = msg.value * percentage / 100; 
        _owner.transfer(myPrecious);
    }
    ...
