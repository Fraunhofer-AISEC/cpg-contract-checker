function rewardPlayer(address memory newOwner,string memory tokenURI){
    
    _mint();
    _setTokenURI(tokenURI);
    transferOwnership(newOwner);
}
