
pragma solidity ^0.8.1;

import { ECDSA } from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract Contract {
    
    using ECDSA for bytes32;


    function randomHash() public view returns(bytes32) {
        return keccak256(abi.encodePacked(block.number));
    }

    function getSignedMessage(bytes memory _message)
        public
        pure
        returns (bytes32)
    {
        return ECDSA.toEthSignedMessageHash(_message);
    }


    function recoverSigner(bytes32 _messageHash, bytes memory _signature)
        public
        view
        returns (address)
    {
        address signer = ECDSA.recover(_messageHash, _signature);

        return signer;
    }
}
