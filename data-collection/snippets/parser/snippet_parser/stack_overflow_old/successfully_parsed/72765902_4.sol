
pragma solidity >=0.8.0 <0.9.0;



import "./SignatureChecker.sol";

contract TestSignature {
    using EnumerableSet for EnumerableSet.AddressSet;
    using SignatureChecker for EnumerableSet.AddressSet;

    EnumerableSet.AddressSet internal signers;

    constructor() {
        signers.add(msg.sender);
    }

    mapping(bytes32 => bool) public usedMessages;

    function mint(
        address to,
        uint256 price,
        bytes32 nonce,
        bytes calldata sig
    ) external payable {
        signers.requireValidSignature(
            signaturePayload(to, price, nonce),
            sig,
            usedMessages
        );
    }

    
    function signaturePayload(
        address to,
        uint256 price,
        bytes32 nonce
    ) public pure returns (bytes memory) {
        return abi.encodePacked(to, price, nonce);
    }

    function generateMessage(bytes memory data) public pure returns (bytes32) {
        return SignatureChecker.generateMessage(data);
    }
}

