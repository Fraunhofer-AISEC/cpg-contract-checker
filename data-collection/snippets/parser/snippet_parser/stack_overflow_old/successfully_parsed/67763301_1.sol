bytes32 public immutable PERMIT_TYPEHASH = keccak256("Permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)");

bytes32 hashStruct = keccak256(abi.encode(PERMIT_TYPEHASH, owner, spender, value, nonces[owner]++, deadline));
