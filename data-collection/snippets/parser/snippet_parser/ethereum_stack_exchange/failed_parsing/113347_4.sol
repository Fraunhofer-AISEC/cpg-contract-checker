for (uint256 i = 0; i < tokenIds.length; i++) {
    uint j = uint256(keccak256(
       abi.encode(randomNumber, i)
    )) % tokenIds.length;
    (tokenIds[j], tokenIds[i]) = (tokenIds[i], tokenIds[j]);
}
