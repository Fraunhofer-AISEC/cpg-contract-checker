contract Color is ERC721, IERC721Enumerable { 
    string[] public colors;
    mapping(string => bool) _colorExists;

    constructor() ERC721("Color", "COLOR") {}

    function mint(string memory _color) public {
        colors.push(_color);
        uint256 _id = colors.length - 1;

        
        _colorExists[_color] = true;
    }
    

    

    function tokenOfOwnerByIndex(address owner, uint256 index) public view override returns (uint256) {
        
        
        return 3;
    }

    function totalSupply() external  view override returns (uint256) {
      
      
      return 1;
    }

    function tokenByIndex(uint256 index) external view  override returns (uint256) {
      
      
      return 5;
    }
}
