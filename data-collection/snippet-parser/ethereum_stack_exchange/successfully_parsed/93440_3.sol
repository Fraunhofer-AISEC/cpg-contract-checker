function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external {
    require(deadline >= block.timestamp, 'SFPY: EXPIRED');

    bytes32 hashStruct = keccak256(
      abi.encode(
        PERMIT_TYPEHASH,
        owner,
        spender,
        value,
        nonces[owner]++,
        deadline
      )
    );

    bytes32 digest = keccak256(
      abi.encodePacked(
          '\x19\x01',
          DOMAIN_SEPARATOR,
          hashStruct
      )
    );
    
    address recoveredAddress = ecrecover(digest, v, r, s);
    require(recoveredAddress != address(0) && recoveredAddress == owner, 'SFPY: INVALID_SIGNATURE');
    _approve(owner, spender, value);
}
