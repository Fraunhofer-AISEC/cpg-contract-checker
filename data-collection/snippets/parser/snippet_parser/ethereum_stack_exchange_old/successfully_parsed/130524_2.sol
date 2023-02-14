mapping(uint256 => bool ) public tokenEntered;
constructor() ERC721("Test", "testing") {
     }
struct TokenTracker{
        bool tokenIsEntered;
        uint256[] tokensEntered;

    }

function mintNft() public returns (uint256) {
    _safeMint(msg.sender, s_tokenCounter);
    s_tokenCounter = s_tokenCounter + 1;
    return s_tokenCounter;
}

function tokenURI(uint256 tokenId) public view override returns (string memory) {
    
    return TOKEN_URI;
}
function registertokenId(uint256 tokenId) public {
    require(msg.sender == ownerOf(tokenId));
    require(tokenIsEntered == false);
    require(tokenEntered[tokenId] != true);
    s_entrants.push(payable(msg.sender));
    tokensEntered.push(tokenId);
    tokenEntered[tokenId] = true;
}
function resetArrayTest() public {
    for (uint256 i = 0; i < tokensEntered.length; i++)
delete tokenEntered[tokensEntered[i]];
s_entrants = new address payable[](0);
}

function getTokenCounter() public view returns (uint256) {
    return s_tokenCounter;
}


function getNumberOfEntrants() public view returns (uint256){
    return s_entrants.length;
}
