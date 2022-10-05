struct Receiver {
    address receiver;
    bool paidOut;
    bool isWinner;
 }
    
mapping(uint => mapping(address => Receiver)) public receivers;

function payout(uint index, address payer) public payable{
    
    Receiver receiver = receivers[index][payer];
   
}
