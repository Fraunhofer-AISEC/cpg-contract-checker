
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract navich is ERC721URIStorage, Ownable {

    using Strings for uint256;
    using Counters for Counters.Counter;

    Counters.Counter private _tokenId;
    string public baseURI = "ipfs://QmRyezUtChrpvH4i4wKEoPngwTFKHuu4YYjZrSg89wvqVq/";

    constructor() ERC721("Wagmi", "Wagmi") {}

    function mintNFT() public payable {
        uint256 dynamic = 1;
        _tokenId.increment();
        _mint(msg.sender, _tokenId.current());
        _setTokenURI(dynamic, baseURI);
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return
            string(
                abi.encodePacked(
                    baseURI,
                    tokenId.toString(),
                    ".json"
                )
            );
    }

    
    

    
    

}
