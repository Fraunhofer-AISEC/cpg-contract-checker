contract GameChar is ERC1155 {
    uint256 public constant CHARACTERS = 0;
 
    constructor() public ERC1155("https://game.example/api/item/{id}.json") {}

    function invokeHero(unit _dna) public {
       _mint(msg.sender, _dna, 1, "");
    }

}
