pragma solidity ^0.4.6;

contract TrackPayments {

    struct PaymentStruct {
        address sender;
        uint amount;
    }

    
    mapping(bytes32 => PaymentStruct) public paymentStructs;

    
    bytes32[] public paymentKeyList;

    event LogPaymentReceived(address sender, uint amount);

    function payMe() public payable returns(bool success) {
        if(msg.value==0) throw;
        
        bytes32 newKey = sha3(msg.sender, paymentKeyList.length);
        paymentStructs[newKey].sender = msg.sender;
        paymentStructs[newKey].amount = msg.value;
        paymentKeyList.push(newKey);
        LogPaymentReceived(msg.sender, msg.value);
        return true;
    }

    function getPaymentCount() public constant returns(uint paymentCount) { return paymentKeyList.length; }

}
