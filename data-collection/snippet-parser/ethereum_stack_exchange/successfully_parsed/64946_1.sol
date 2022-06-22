



function tokenURI(uint256 _tokenId)
    external
    view
    mustBeValidToken(_tokenId)
    returns (string _tokenURI)
{
    _tokenURI = "https://tenthousandsu.com/erc721/00000.json";
    bytes memory _tokenURIBytes = bytes(_tokenURI);
    _tokenURIBytes[33] = byte(48+(_tokenId / 10000) % 10);
    _tokenURIBytes[34] = byte(48+(_tokenId / 1000) % 10);
    _tokenURIBytes[35] = byte(48+(_tokenId / 100) % 10);
    _tokenURIBytes[36] = byte(48+(_tokenId / 10) % 10);
    _tokenURIBytes[37] = byte(48+(_tokenId / 1) % 10);

}
