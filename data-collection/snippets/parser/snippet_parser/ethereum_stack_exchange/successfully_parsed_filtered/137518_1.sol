
pragma solidity ^0.8.0;
pragma abicoder v2; 

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol";

contract Test {
    struct EIP712Domain {
        string  name;
        string  version;
        uint chainId;
        address verifyingContract;
    }

struct Identity {
    uint256 userId;
    address wallet;
}

bytes32 private constant IDENTITY_TYPEHASH = keccak256("Identity(uint256 userId,address wallet)");

uint256 constant chainId = 5;
address verifyingContract = address(this);
bytes32 constant salt = 0xf2d857f4a3edcb9b78b4d503bfe733db1e3f6cdc2b7971ee739626c97e86a558;
bytes32 private constant EIP712_DOMAIN_TYPEHASH = keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract,bytes32 salt)");
bytes32 private DOMAIN_SEPARATOR = keccak256(abi.encode(
    EIP712_DOMAIN_TYPEHASH,
    keccak256(bytes("Test sign")),
    keccak256(bytes("1")),
    chainId,
    verifyingContract,
    salt
));

function hashIdentity(Identity memory identity) private view returns (bytes32) {
    return keccak256(abi.encodePacked(
        "\\x19\\x01",
       DOMAIN_SEPARATOR,
       keccak256(abi.encodePacked(
        IDENTITY_TYPEHASH,
        identity.userId,
        identity.wallet
       ))
   ));
}

function verify(address signer, Identity memory identity, uint8 v, bytes32 r, bytes32 s) public view returns(bool) {
    return signer == ecrecover(hashIdentity(identity), v, r, s);
}

}
