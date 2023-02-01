pragma solidity ^0.8.7;

import '@openzeppelin/contracts/utils/cryptography/ECDSA.sol';
import '@openzeppelin/contracts/utils/cryptography/draft-EIP712.sol';

contract SignCheck is EIP712 {
    using ECDSA for bytes32;
    address org;
    struct forwardData {
        address from;
        bytes32 name;
    }

    bytes32 private constant typeHash =
        keccak256(
            'forwardData(address from,bytes32 name)' 
        );

    constructor(address org_) EIP712('test', '1') {
        org = org_;
    }

    function verify(forwardData calldata data, bytes calldata signature)
        internal
        view
        returns (address)
    {
        return _hashTypedDataV4(
            keccak256(
                abi.encode(typeHash, data.from, data.name)
            )
        ).recover(signature);
    }

    function check(
        forwardData calldata data,
        bytes calldata signature
    ) external view returns (address) {
        return verify(data, signature);
    }
}
