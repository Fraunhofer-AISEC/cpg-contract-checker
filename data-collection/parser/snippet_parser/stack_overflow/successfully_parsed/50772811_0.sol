pragma solidity ^0.4.24;

import "openzeppelin-solidity/contracts/ECRecovery.sol";


contract MyContract {
    using ECRecovery for bytes32;
    address permittedSinger;

    function doSomething(
    bytes32 id, uint256 amount, bytes sig
    ) {
        bytes32 hash = getHash(msg.sender, id, amount);
        address msgSigner = hash.recover(sig);
        require(msgSigner == permittedSinger);
    }

    function getMsgSigner(bytes32 proveHash, bytes sig) public pure returns (address) {
        return proveHash.recover(sig);
    }

    function getHash(
    address receiver, bytes32 id, uint256 amount
    ) pure returns (bytes32) {
        return keccak256(abi.encodePacked(receiver, id, amount));
    }
}
