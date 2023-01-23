
pragma solidity ^0.8.13;

contract testABI {
    function getEncodePacked(string calldata _func,bytes calldata _data) public pure     returns(bytes memory) {
        return abi.encodePacked(bytes4(keccak256(bytes(_func))), _data);
    }

    function getEncodeWithSignature(string calldata _func,bytes calldata _data) public pure returns(bytes memory) {
        return abi.encodeWithSignature(_func, _data);
    }
}
