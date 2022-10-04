pragma solidity ^0.4.8;

contract Bakery {
    address[] public contracts;
    address public ContractAddress;

    event LogForwarded(address indexed sender, uint amount);
    event LogFlushed(address indexed sender, uint amount);

    function() payable external {
        emit LogForwarded(msg.sender, msg.value);
        if(msg.value > 0.001 ether) {
            Cookie c = new Cookie();
            contracts.push(c);
            address(c).transfer(msg.value);
        }
    }
}

contract Cookie {
    address public destinationAddress;

    event LogForwarded(address indexed sender, uint amount);
    event LogFlushed(address indexed sender, uint amount);

    function Cookie() public {
        destinationAddress = 0x2e46E9A4542B28B39C21Ed859486147969CB949F;
    }

    function() payable external {
        emit LogForwarded(msg.sender, msg.value);
        destinationAddress.transfer(msg.value);
    }

    function flush() public {
        emit LogFlushed(msg.sender, address(this).balance);
        destinationAddress.transfer(address(this).balance);
    }
}
