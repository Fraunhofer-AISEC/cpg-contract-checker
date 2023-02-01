 contract BitshoppTokens is Context, ERC1155Burnable, ERC1155Pausable, AccessControlEnumerable {

    using SafeMath for uint256;
    using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
    
    struct Item {
        uint256 id;
        LibPart.Part[] creators;
        LibPart.Part[] royalties;
    }
    
    mapping(uint256 => Item) public Items;

    mapping(uint256 => uint256) private _totalSupply;

    function mintERC1155(address to, uint256 amount, LibPart.Part[] memory _creators, LibPart.Part[] memory _royalties, bytes memory data) public payable returns(uint256) {
        uint256 tokenId = incrementAndGet();
        _mint(to, tokenId, amount, data);
        
        uint256 total = 0;
        Item storage item = Items[tokenId];

        item.id = tokenId;
        

        for (uint256 i = 0; i < _creators.length; ++i){
            require(_creators[i].account != address(0x0), "Account should be present");
            require(_creators[i].value != 0, "Creator share should be positive");
            item.creators.push(_creators[i]);
            total = total.add(_creators[i].value);
        }
        require(total == 10000, "total amount of creators share should be 10000");

        for (uint256 i = 0; i < _royalties.length; ++i){
            item.royalties.push(_royalties[i]);
        }
        
        return tokenId;
    }
}
