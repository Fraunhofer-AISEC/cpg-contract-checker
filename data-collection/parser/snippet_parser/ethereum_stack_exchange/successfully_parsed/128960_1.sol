

pragma solidity ^0.8.0;

contract validateData {

    address _validationKey = 0xCD2a3d9F938E13CD947Ec05AbC7FE734Df8DD826;

    struct EIP712Domain {
        string  name;
        string  version;
        uint256 chainId;
        address verifyingContract;
    }

    struct Validation {
        address wallet;
        uint256 share;
        uint256 pool;
    }

    bytes32 constant EIP712DOMAIN_TYPEHASH = keccak256(
        "EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)"
    );

    bytes32 constant VALIDATION_TYPEHASH = keccak256(
        "Validation(address wallet,uint256 share,uint256 pool)"
    );

    bytes32 DOMAIN_SEPARATOR;

    constructor () {
        DOMAIN_SEPARATOR = hash(EIP712Domain({
            name: "Validator",
            version: '1',
            chainId: 1,
            verifyingContract: 0xCcCCccccCCCCcCCCCCCcCcCccCcCCCcCcccccccC
        }));
    }

    function hash(EIP712Domain memory eip712Domain) internal pure returns (bytes32) {
        return keccak256(abi.encode(
            EIP712DOMAIN_TYPEHASH,
            keccak256(bytes(eip712Domain.name)),
            keccak256(bytes(eip712Domain.version)),
            eip712Domain.chainId,
            eip712Domain.verifyingContract
        ));
    }

    function hash(Validation calldata validation) internal pure returns (bytes32) {
        return keccak256(abi.encode(
            VALIDATION_TYPEHASH,
            validation.wallet,
            validation.share,
            validation.pool
        ));
    }

    event compare(address sig, address key);

    function verify(Validation calldata validation, uint8 v, bytes32 r, bytes32 s) public {
        bytes32 digest = keccak256(abi.encodePacked(
            "\x19\x01",
            DOMAIN_SEPARATOR,
            hash(validation)
        ));
        emit compare(ecrecover(digest, v, r, s), _validationKey);
    }
    
}
