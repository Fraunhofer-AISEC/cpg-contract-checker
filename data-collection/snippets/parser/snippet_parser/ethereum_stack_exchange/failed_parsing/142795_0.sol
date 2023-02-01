contract Vault is Ownable, EIP712 {
    bytes32 public constant TOKEN_PERMIT_TYPEHASH = keccak256(
        "TokenPermit("
            "address token,"
            "address spender,"
            "uint256 value,"
            "uint256 nonce,"
            "uint256 deadline"
        ")"
    );

    mapping(address => uint256) public nonces;

    function tokenPermit(
        address token,
        address spender,
        uint256 value,
        uint256 deadline,
        bytes memory signature,
    ) external {
        require(block.timestamp <= deadline, "ERC20Permit: expired deadline");

        bytes32 structHash = keccak256(abi.encode(TOKEN_PERMIT_TYPEHASH, token, spender, value, nonces[spender]++, deadline));

        bytes32 hash = _hashTypedDataV4(structHash);

        address signer = SignatureChecker.isValidSignatureNow(owner(), hash, signature);
        require(signer == owner(), "TokenPermit: invalid signature");

        IERC20(token).approve(spender, value);
    }
}
