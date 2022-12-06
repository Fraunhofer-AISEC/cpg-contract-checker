
pragma solidity 0.8.13;

import {ECDSA} from "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/cryptography/ECDSA.sol";

contract MySignatureTest {
    using ECDSA for bytes32;
    
    function verifyMessage(bytes32 messageHash, bytes memory signedMessage, address account) external pure returns (bool) {
        return messageHash
            .toEthSignedMessageHash()
            .recover(signedMessage) == account;
    }
}
