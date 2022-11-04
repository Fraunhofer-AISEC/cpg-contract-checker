    contract StarNotary is ERC721 { 

    struct Star { 
        string name;
        string dec;
        string mag;
        string cent;
        string story;
    }

    using Library for Library.data;
    mapping(uint256 => Star) public tokenIdToStarInfo; 
    mapping(address => uint256[]) private _ownerToTokenId; 
    mapping(uint256 => uint256) private _starsForSale;
    mapping(bytes32 => Library.data) private _hashToTokenId;

    Star[] public stars;
    uint256[] tokensForSale;

    function createStar(string _name, string _dec, string _mag, string _cent, string _story) 
    public
    returns(uint256) 
    {
        require(!checkIfStarExist(_dec, _mag, _cent), "Star already registered!");

        Star memory newStar = Star(_name,_dec,_mag,_cent,_story);

        uint256 tokenId = stars.push(newStar) - 1;

        return tokenId;

    }
}
