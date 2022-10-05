pragma solidity 0.4.24;

contract Test {

    mapping(address => mapping(bytes32 => address)) testMapping;

    function didItChangeIt() public returns(bool) {
        address _address = msg.sender;
        bytes32 _bytes32 = keccak256(abi.encodePacked(_address));
        if (testMapping[_address][_bytes32] == 0) {
            testMapping[_address][_bytes32] = _address;
            return (true);
        }
        return (false);
    }
}
