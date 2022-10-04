
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Basic is ERC721A, Ownable {
    using Strings for uint256;
    string private BaseURI;

    constructor() ERC721A("NAME", "SYMBOL") {
        BaseURI = "ipfs://...";
    }

    function _startTokenId() internal view virtual override returns (uint256) {
        return 1;
    }

    function setBaseURI(string memory _uri) external onlyOwner {
        BaseURI = _uri;
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        override
        returns (string memory)
    {
        require(_exists(_tokenId), "tokenURI : nonexistent token");
        return
            string(
                abi.encodePacked(
                    BaseURI,
                    "/",
                    Strings.toString(_tokenId),
                    ".json"
                )
            );
    }

    function mint(address _address, uint256 quantity) external onlyOwner {
        _mint(_address, quantity);
    }
}
