pragma solidity ^0.8.0;

contract GenerateAddress {
    bytes public publicKey = "6d7bac197da6e91f506db699a1844efc93b9bf5508bacb6870a98fc2137c4330741f94af61aa635a44f9059ff2082737d43cfb376124ae8772250b85f656aa1d";

    function generateAddress() public view returns (address addr) {
        bytes32 publicKeyHash = keccak256(publicKey);
        addr = address(bytes20(publicKeyHash));
        return addr;
    }

}
