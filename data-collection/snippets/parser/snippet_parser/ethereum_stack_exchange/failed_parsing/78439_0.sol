struct NFT {
    ...
    uint urlKeccak256;
}
mapping(uint => string) private urlMap;

function saveUrl(string calldata _url) {
    ...
    uint _urlKeccak256 = uint(keccak256(abi.encode(_url)));
    urlMap[_urlKeccak256] = _url;

    NFT memory nft;
    nft.urlKeccak256 = _urlKeccak256;
}
