pragma solidity ^0.4.24;

contract Forwarder {

    address public destinationAddress;
    address constant public otherAddress = 0xf17f52151EbEF6C7334FAD080c5704D77216b732;

    event LogForwarded(address indexed sender, uint amount);
    event LogFlushed(address indexed sender, uint amount);

    function Forwarder() public {
        destinationAddress = msg.sender;
    }

    function() payable public {
        emit LogForwarded(msg.sender, msg.value);
        otherAddress.transfer(msg.value /3);        
        destinationAddress.transfer(msg.value /3);  
    }

    function flush() public {
        emit LogFlushed(msg.sender, address(this).balance);
        destinationAddress.transfer(address(this).balance);
    }

}
