mapping(uint256 => string) tokenToURI;

function tokenTypeURI(uint256 tokenType) public
    returns (string memory)
{
    return typeToToken[tokenType];
}
