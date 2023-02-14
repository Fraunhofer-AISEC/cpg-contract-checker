uint256 public royaltyPerc = 3;
    uint256 public cost = 2.50 ether;
    address payable public royaltyContract;
    bytes4 private constant _INTERFACE_ID_ERC2981 = 0x2a55205a;
    
    
    constructor (
        string memory _name,
        string memory _symbol,
        string memory _initBaseURI
        ) ERC721(_name, _symbol) {
            
            royaltyContract = payable(msg.sender);
            setBaseURI(_initBaseURI);
            mint(msg.sender, 1);
            
        }
        
        
        function mint(address _to, uint256 _mintAmount) public payable {
            uint256 supply = totalSupply();
            require(!paused);
            require(_mintAmount > 0);
            require(_mintAmount <= maxMintAmount);
            require(supply + _mintAmount <= maxSupply);
            
            for (uint256 i = 1; i <= _mintAmount; i++) {
                _safeMint(_to, supply + i);
            }
            
        }
        
        function setRoyaltyPercent ( uint256 _perc ) public onlyOwner {
            royaltyPerc = _perc;
        }

        function royaltyInfo( uint256 _tokenId, uint256 _salePrice ) public  view returns ( address receiver, uint256 royaltyAmount ) {
            receiver = royaltyContract;
            royaltyAmount = _salePrice * royaltyPerc / 100;
        }
