modifier mintCompliance(uint256 _mintAmount) {

    _;
}

function totalSupply() public view returns (uint256) {
    return supply.current();
}


function mint(uint256 _mintAmount) public payable mintCompliance(_mintAmount) {
    require(!paused, "The contract is paused!");

    
    if (msg.sender != owner()) { 
        uint _userBalance = IERC721(0x00...).balanceOf(msg.sender);

        if(_userBalance > 0) {
            for(uint i; i < _userBalance; i++) {
                uint _tokenId = IERC721(0x00...).tokenOfOwnerByIndex(msg.sender, i);
                if(!usedTokens[_tokenId]) { 
                    usedTokens[_tokenId] = true;

                    uint256 ownerTokenCount = addressMintedBalance[msg.sender];
                    require(ownerTokenCount + _mintAmount <= FreeMints, "max per free mint exceeded");
                    require(_mintAmount > 0 && _mintAmount <= maxMintAmount, "Invalid mint amount!");
                    require(supply.current() + _mintAmount <= maxSupply, "Max supply exceeded!");
                    require(_mintAmount <= maxMintAmount, "max mint amount per session exceeded");
                }
            }
        } else {
            require(msg.value >= cost * _userBalance, "Insufficient funds!");
            _mintLoop(msg.sender, _mintAmount);
        }
    }
}
