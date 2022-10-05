pragma solidity ^0.5.1;


contract Encoding {

    function encode(address _address1, address _address2) public pure returns (bytes memory output) {
        return abi.encodePacked(_address1, _address2);
    }

    function decode(bytes memory _encoded) public pure returns (address x, address y) {
        assembly {
            x := mload(0x94)
            y := mload(0xa8)
        }
    }
}
