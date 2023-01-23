bytes32 public constant PERMIT_TYPEHASH = keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");

bytes32 structHash = keccak256(abi.encode(PERMIT_TYPEHASH, owner, spender, rawAmount, nonces[owner]++, deadline)); 
