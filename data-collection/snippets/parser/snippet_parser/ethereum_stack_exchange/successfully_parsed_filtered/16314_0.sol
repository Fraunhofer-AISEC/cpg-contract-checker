contract Purchase {
address seller;
uint value;

function Purchase() payable {
    seller = msg.sender;
    value = msg.value / 2;
    
    }
}
