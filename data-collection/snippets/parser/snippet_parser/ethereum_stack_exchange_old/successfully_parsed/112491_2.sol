contract HeroToken is IERC1155 {
    constructor() {
        
        _mint(msg.sender, 0, 100000, "");
    }

    function invokeRandomHero(address _player, string memory _tokenUri) public {
        burn(msg.sender, 0, 100);
        _tokenIds.increment();
        _mint(_player, _tokenIds.current(), 1, ""); 

        
    }
}
