
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract MyToken is ERC721, ERC721Enumerable, Ownable {
    
    using Strings for uint256;

        using Counters for Counters.Counter;

        Counters.Counter private _tokenIds;

        string public baseURI;
        string public baseExtension = ".json";
        uint256 public cost = 0.03 ether;
        uint256 public maxSupply = 1000;
        uint256 public maxMintAmount = 5;
        bool public paused = false;
    

    string public contractURI;
    uint96 royaltyFeesInBips;
    address royaltyAddress;

    constructor(string memory _name,
            string memory _symbol,
            string memory _initBaseURI,
            uint96 _royaltyFeesInBips
             ) ERC721(_name, _symbol) {
            setBaseURI(_initBaseURI);
            mint(msg.sender, 1);
        royaltyFeesInBips = _royaltyFeesInBips;
        royaltyAddress = owner();
        contractURI = _initBaseURI;
       
    }

    
        function _baseURI() internal view virtual override returns (string memory) {
            return baseURI;
        }

        
        function mint(address _to, uint256 _mintAmount) public payable {
            uint256 supply = totalSupply();
            require(!paused);
            require(_mintAmount > 0);
            require(_mintAmount <= maxMintAmount);
            require(supply + _mintAmount <= maxSupply);

            

            for (uint256 i = 1; i <= _mintAmount; i++) {
            _safeMint(_to, supply + i);
            _tokenIds.increment();
            }
        }


        function count() public view returns (uint256){
            return _tokenIds.current();
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
            return bytes(currentBaseURI).length > 0
                ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), baseExtension))
                : "";
        }


    
        function setCost(uint256 _newCost) public onlyOwner() {
            cost = _newCost;
        }

        function setmaxMintAmount(uint256 _newmaxMintAmount) public onlyOwner() {
            maxMintAmount = _newmaxMintAmount;
        }

        function setBaseURI(string memory _newBaseURI) public onlyOwner {
            baseURI = _newBaseURI;
        }

        function setBaseExtension(string memory _newBaseExtension) public onlyOwner {
            baseExtension = _newBaseExtension;
        }

        function pause(bool _state) public onlyOwner {
            paused = _state;
        }


        function withdraw() public payable onlyOwner {
            require(payable(msg.sender).send(address(this).balance));
        }

        
    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }

    function setRoyaltyInfo(address _receiver, uint96 _royaltyFeesInBips) public onlyOwner {
        royaltyAddress = _receiver;
        royaltyFeesInBips = _royaltyFeesInBips;
    }

    function setContractURI(string calldata _contractURI) public onlyOwner {
        contractURI = _contractURI;
    }

    
    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function royaltyInfo( uint256 _salePrice)
        external
        view
        virtual
        
        returns (address, uint256)
    {
        return (royaltyAddress, calculateRoyalty(_salePrice));
    }

    function calculateRoyalty(uint256 _salePrice) view public returns (uint256) {
        return (_salePrice / 10000) * royaltyFeesInBips;
    }

    function supportsInterface(bytes4 interfaceId)
            public
            view
            override(ERC721, ERC721Enumerable)
            returns (bool)
    {
        return interfaceId == 0x2a55205a || super.supportsInterface(interfaceId);
    }
}
