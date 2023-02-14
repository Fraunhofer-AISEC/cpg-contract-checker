
pragma solidity >=0.8.0 <0.9.0;



import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract KINGs300 is ERC721Enumerable, Ownable {

    using Strings for uint256;

    string public baseURI;
    string public baseExtension = ".json";
    uint256 public  cost = 0.5 ether;
    uint256 public  maxSupply = 300;

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _initBaseURI
    )
    ERC721(_name, _symbol) {
        setBaseURI(_initBaseURI);
        mint(msg.sender, 300);
    }

    function _baseURI() internal  view override virtual  returns (string memory) {
        return baseURI;
    }

    function mint(address _to, uint256 _mintAmount) public  payable {
        uint256 supply = totalSupply();
        require(_mintAmount > 0);
        require(supply + _mintAmount <= maxSupply);

        for (uint256 i = 1; i <= _mintAmount; i++) {
            _safeMint(_to, supply + i);
        }
    }


function walletOfOwner(address _owner) public  view  returns (uint256[] memory)
    {
        uint256 ownerTokenCount = balanceOf(_owner);
        uint256[] memory tokenIds = new uint256[](ownerTokenCount);
        for (uint256 i; i < ownerTokenCount; i++) {
            tokenIds[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return tokenIds;
    }

    function tokenURI(uint256 tokenId) public  view override virtual returns (string memory)
    {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory currentBaseURI = _baseURI();
        return  bytes(currentBaseURI).length > 0
                ? string(abi.encodePacked(currentBaseURI,tokenId.toString(),baseExtension))
                : "";
    }




    function setCost(uint256 _newCost) public onlyOwner {
        cost = _newCost;
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }
        
    function setBaseExtension(string memory _newBaseExtension) public onlyOwner {
        baseExtension = _newBaseExtension;
    }

}

