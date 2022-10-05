function mint(address to) public virtual {
    require(hasRole(MINTER_ROLE, _msgSender()), "ERC721PresetMinterPauserAutoId: must have minter role to mint");

    _mint(to, _tokenIdTracker.current());
    _tokenIdTracker.increment();
}
