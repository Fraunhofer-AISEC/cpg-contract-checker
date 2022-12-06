 function mintWhitelist(bytes32[] calldata merkleProof) public payable
    isValidMerkleProof(merkleProof, WhiteListMerkleRoot)
    isCorrectPayment(WhiteListPrice, 80000000000000000)
{
    uint256 supply = totalSupply();
    require(supply + 1 <= totalSupply, "max NFT limit exceeded");
    _safeMint(msg.sender, supply + 1);
}
