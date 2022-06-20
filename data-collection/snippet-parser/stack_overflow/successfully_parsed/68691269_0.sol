
pragma solidity >=0.4.22 <0.9.0;

import "./ERC721Tradable.sol";

contract MyContract is ERC721Tradable {
    string apiUrl;

    constructor(address _proxyRegistryAddress)
        ERC721Tradable("MyContract", "MyToken", _proxyRegistryAddress)
    {
        apiUrl = "https://morning-woodland-24255.herokuapp.com/nftart/";
    }

    function baseTokenURI() public view override returns (string memory) {
        return apiUrl;
    }

    function setBaseTokenURI(string memory _apiUrl) public onlyOwner {
        apiUrl = _apiUrl;
    }
}
