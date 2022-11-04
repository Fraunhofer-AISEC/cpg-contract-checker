contract GalaxyExplorer is ERC721Enumerable{
    struct Land {
        string name;
        address tenant;
        uint256 x;
        uint256 y;
    }
    struct Planet {
        string name;
        address owner;
        uint256 x;
        uint256 y;
        mapping(uint256 => Land) lands;
    }
    mapping(uint256 => Planet) public planets;
    
    constructor() ERC721("Galaxy Explorer", "GE") {
        planets[0].name = 'Genexy';
        planets[0].owner = msg.sender;
        planets[0].x = 0;
        planets[0].y = 0;
        planets[0].lands[0] = Land('Alpha', address(0), 0, 0);
    }
}
