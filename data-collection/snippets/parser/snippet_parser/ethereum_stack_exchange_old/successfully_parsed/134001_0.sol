     
    struct NFTType {
        string name; 
        uint256 maxSupply;
        string baseExtension; 
        uint256 cost;
    }

 constructor(
        string memory _name, 
        string memory _symbol, 
        string memory _initBaseURI 
    ) ERC721(_name, _symbol) {
NFTTypes[1].name = "Tier 1 NFT";
        NFTTypes[1].maxSupply = 99999999999999999999999;
        NFTTypes[1].baseExtension = "tier1.json";
        NFTTypes[1].cost = tokenCurrentPrice * 5000; 

        NFTTypes[2].name = "Tier 2 NFT";
        NFTTypes[2].maxSupply = 200;
        NFTTypes[2].baseExtension = "tier2.json";
        NFTTypes[2].cost =  tokenCurrentPrice * 3000;  

        NFTTypes[3].name = "Tier 3 NFT";
        NFTTypes[3].maxSupply = 200;
        NFTTypes[3].baseExtension = "tier2.json";
        NFTTypes[3].cost = tokenCurrentPrice * 1500; 

}


 function mint(uint NFTtype, address to)
        public
        whenNotPaused
        payable
        returns (uint256)
    {
        
        if(NFTtype== 1){
            
            require(TOKEN.balanceOf(msg.sender) >= NFTTypes[NFTtype].cost, "Amount less than the mint price");

            TOKEN.transferFrom(to, address(this), NFTTypes[NFTtype].cost);

            typeOneCurrentTokenId.increment();
            uint256 newItemId = typeOneCurrentTokenId.current();
            TokenTypes[newItemId] = NFTtype;
            _safeMint(to, newItemId);
            NFTholders[to] = NFTtype;
            return newItemId;

        }

}
