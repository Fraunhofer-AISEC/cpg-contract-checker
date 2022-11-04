function transfer(address payable to, uint nftId) external payable {
    require(_exists(nftId), "transfer of non existing token");
    require(_isApprovedOrOwner(msg.sender, nftId), "Sender not approved nor owner");
    _transfer(msg.sender, to, nftId);
}
