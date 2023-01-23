
pragma solidity ^0.8.0;
contract Logstuff {
    function senderaddr() public view returns (address) {
        return msg.sender;
    }
}
contract AAA {

    function asenderaddr(address _contract) public returns (bytes memory) {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("senderaddr()")
        );
        return data;
    }
    
}
contract BBB {
    uint public num;
    address public sender;

    function aasenderaddr(address _contract, address _contract2) public returns (bytes memory) {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("asenderaddr()", _contract2)
        );
        return data;
    }
    
    function basenderaddr(address _contract, address _contract2) public returns (bytes memory) {
        (bool success, bytes memory data) = _contract.call(
            abi.encodeWithSignature("asenderaddr()", _contract2)
        );
        return data;
    }

}

