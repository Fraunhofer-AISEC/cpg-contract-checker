contract CutoutNFTFactory is ERC721URIStorage{

    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;


    constructor() ERC721("Cutout","COF"){
            

    }

    function createToken(string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);    
        return newItemId;


    }


}
