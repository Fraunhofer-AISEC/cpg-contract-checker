function mintPoloy() public {
    require(_hasMinted(), "Already minted cheater!");
    tokenSupply[Poloy]++;
    _mint(msg.sender, Poloy, 1, "0x000");

}

function mintLeafy() public {
    require(_hasMinted(), "Already minted cheater!");
    tokenSupply[Leafy]++;
    _mint(msg.sender, Leafy, 1, "0x000");
    
}

function _hasMinted() private view returns (bool) {
    return
        ((balanceOf(msg.sender, Poloy) + balanceOf(msg.sender, Leafy)) > 0)
            ? false
            : true;
}
