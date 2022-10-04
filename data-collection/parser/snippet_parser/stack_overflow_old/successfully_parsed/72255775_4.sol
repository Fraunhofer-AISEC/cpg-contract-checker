function mintListed(
    uint256 amount,
    bytes32[] calldata merkleProof,
    uint256 maxAmount
) public payable nonReentrant {
    address sender = _msgSender();

    require(isActive, "Sale is closed");
    require(
        amount <= maxAmount - _alreadyMinted[sender],
        "Insufficient mints left"
    );
    require(_verify(merkleProof, sender, maxAmount), "Invalid proof");
    require(msg.value == price * amount, "Incorrect payable amount");

    _alreadyMinted[sender] += amount;
    _internalMint(sender, amount);
}
