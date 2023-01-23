
pragma solidity >=0.7.0 <0.9.0;
contract SimplePaymentChannel {

    address payable public sender;      
    address payable public recipient;   
    uint256 public expiration;  

    constructor (address payable recipientAddress, uint256 duration)
        payable
    {
        sender = payable(msg.sender);
        recipient = recipientAddress;
        expiration = block.timestamp + duration;
    }

    function close(uint amount) public{
        recipient.transfer(amount);
    }
}
