
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract SignatureChecker is EIP712 {
    using ECDSA for bytes32;

    struct Fee {
        address recipient;
        uint256 value;
    }

    struct Request {
        address to;
        address from;
        Fee[] fees;
    }

    bytes32 public constant FEE_TYPEHASH = keccak256("Fee(address recipient,uint256 value)");
    bytes32 public constant REQUEST_TYPEHASH =
        keccak256(
            "Request(address to,address from,Fee[] fees)Fee(address recipient,uint256 value)"
        );

    constructor() EIP712("SignatureChecker", "1") {}

    function verify(
        Request calldata request,
        bytes calldata signature,
        address signer
    ) external view returns (bool) {
        return recoverAddressOfRequest(request, signature) == signer;
    }

    function recoverAddressOfRequest(
        Request calldata request,
        bytes calldata signature
    ) public view returns (address) {
        return _hashTypedDataV4(keccak256(encodeRequest(request))).recover(signature);
    }

    function recoverAddressOfFee(
        Fee calldata fee,
        bytes calldata signature
    ) public view returns (address) {
        return _hashTypedDataV4(keccak256(encodeFee(fee))).recover(signature);
    }

    function encodeFee(Fee calldata fee) public pure returns (bytes memory) {
        return abi.encode(FEE_TYPEHASH, fee.recipient, fee.value);
    }

    function encodeRequest(Request calldata request) public pure returns (bytes memory) {
        bytes32[] memory encodedFees = new bytes32[](request.fees.length);
        for (uint256 i = 0; i < request.fees.length; i++) {
            encodedFees[i] = keccak256(encodeFee(request.fees[i]));
        }

        return
            abi.encode(
                REQUEST_TYPEHASH,
                request.to,
                request.from,
                keccak256(abi.encodePacked(encodedFees))
            );
    }
}
