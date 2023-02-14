pragma solidity >=0.7.0 <0.9.0;

import "./IERC165.sol";
import "./IERC721.sol";
import "./IERC721Enumerable.sol";
import "./ERC165.sol";
import "./Strings.sol";
import "./Address.sol";
import "./IERC721Metadata.sol";
import "./IERC721Receiver.sol";
import "./ERC721.sol";
import "./ERC721Enumerable.sol";
import "./Ownable.sol";

contract rNFT is ERC721Enumerable, Ownable {
    using Strings for uint256;

    string baseURI; 
    string linkURL;
    string public baseExtension = ".json";
    uint256 public cost; 
    uint256 public maxMintAmount = 1;
    bool public isInVault = false;

    event Logging(string value);

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _initBaseURI
    ) ERC721(_name, _symbol) {
        setBaseURI(_initBaseURI);
    }

    
    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }

    
    function mint(string memory _linkURL) public payable returns (uint) {
        uint256 supply = totalSupply();
        uint256 tokenID = supply + 1;

        if (msg.sender != owner()) {
            require(msg.value >= cost);
        }

        emit Logging(_linkURL);
        setLinkURL(_linkURL);

        _safeMint(msg.sender, tokenID);

        return tokenID;
    }

    function walletOfOwner(address _owner)
        public
        view
        returns (uint256[] memory)
    {
        uint256 ownerTokenCount = balanceOf(_owner);
        uint256[] memory tokenIds = new uint256[](ownerTokenCount);
        for (uint256 i; i < ownerTokenCount; i++) {
            tokenIds[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return tokenIds;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        require(
            _exists(tokenId),
            "ERC721Metadata: URI query for nonexistent token"
        );

        string memory currentBaseURI = _baseURI();
        return
            bytes(currentBaseURI).length > 0
                ? string(
                    abi.encodePacked(
                        currentBaseURI,
                        tokenId.toString(),
                        baseExtension
                    )
                )
                : "";
    }

    
    function setIsInVault() public onlyOwner {
        isInVault = true;
    }

    function setLinkURL(string memory _linkUrl) public onlyOwner {
        linkURL = _linkUrl;
    }

    function setCost(uint256 _newCost) public onlyOwner {
        cost = _newCost;
    }

    function setmaxMintAmount(uint256 _newmaxMintAmount) public onlyOwner {
        maxMintAmount = _newmaxMintAmount;
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function setBaseExtension(string memory _newBaseExtension)
        public
        onlyOwner
    {
        baseExtension = _newBaseExtension;
    }

    function withdraw() public payable onlyOwner {

        
        (bool os, ) = payable(owner()).call{value: address(this).balance}("");
        require(os);
    }
}

