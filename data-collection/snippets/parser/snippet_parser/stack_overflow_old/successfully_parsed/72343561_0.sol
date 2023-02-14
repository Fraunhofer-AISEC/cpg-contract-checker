
pragma solidity ^0.8.3;

    import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
    import "@openzeppelin/contracts/access/Ownable.sol";
    import "@openzeppelin/contracts/security/Pausable.sol";
    
    contract NFT is ERC721Enumerable, Ownable, Pausable  {
      using Strings for uint256;
      string baseURI="";
      string private baseExtension = ".json";
      uint256 public _batch = 9456;
      bool public _firstwhitelist = true;
      bool public _allpeople = false;
      uint256 public _qtyperMint = 1; 
      uint256 public price = 0.001 ether;
      uint256 private supplycount = 0;
      address payable public _holderEth;
      uint256 public holderID = 0;
     
      address[] private allowedWhite1;
      address[] private HoldersBook; 
    
      constructor (address _addr, string memory _URI ) ERC721("Our token", "OTK") {
        _holderEth=payable(_addr);
        baseURI=_URI;
      }
        struct Holders {
        uint itemId;
        address owner;
        bool sold;
      }
    
      mapping(uint256 => Holders) private idToHolders;
      
      function ErraseListe1 ()public onlyOwner {
        delete allowedWhite1; 
      }
    
      function addallowedWhite1(address[] memory minteraddr) public onlyOwner {
        for (uint256 i=0; i<minteraddr.length;i++){
            allowedWhite1.push(minteraddr[i]);
        }
           
      }
         function MinterIsAllowed1(address minteraddr) public view returns (bool) {
          for (
                uint256 allowedminter = 0;
                allowedminter < allowedWhite1.length;
                allowedminter++
            ) {
                if (allowedWhite1[allowedminter] == minteraddr) {
                    return true;
                }
            }
            return false;
        }
    
        function IfMinted(address minteraddr) public view returns (bool) {
        for (
              uint256 allowedminter = 0;
              allowedminter < HoldersBook.length;
              allowedminter++
          ) {
              if (HoldersBook[allowedminter] == minteraddr) {
                  return true;
              }
          }
          return false;
      }
    
        function changeQtymint(uint256 _newqty) public onlyOwner returns(bool result){
           _qtyperMint=_newqty;
           return true;
        }
    
    
      function changeHolder(address _newaddr) public onlyOwner returns (bool)  { 
        _holderEth=payable(_newaddr);
        return true;
      }
    
      function changeUri(string memory _newUri) public onlyOwner returns (bool)  { 
        baseURI=_newUri;
        return true;
      }
    
      function changeWhitelist1() public onlyOwner returns (bool) {
       if(_firstwhitelist){
             _firstwhitelist=false;  
       } else if (!_firstwhitelist){
             _firstwhitelist=true;
            _allpeople=false;
       }
       return true;
      }
    
      function changeAllminting() public onlyOwner returns (bool)  { 
        _allpeople=true;
        _firstwhitelist=false;
        return true;
      }
    
     function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
      }
    
      function claim(uint256 _qty)public payable returns (bool result){
      
        require(_qty > 0 ,"cannot mint 0 NFT");
        require(_qty <= _qtyperMint,"Quantity more than 5");
        require(_batch > 0,"first drop is over");
        require(msg.value >= price * _qty,"unsufficiant funds");
    
        if (_firstwhitelist) {
            require(MinterIsAllowed1(msg.sender), "only people allowed can mint");
            require((balanceOf(msg.sender)) < _qtyperMint,"You cannot hold more than the limit set");
            uint256 supply = supplycount;  
            for (uint256 i = 1; i <= _qty; i++) {
              _safeMint(msg.sender, supply+i);
            }
            supplycount=supplycount+_qty;
            _holderEth.transfer(msg.value);
            _batch=_batch - _qty;
            if(!IfMinted(msg.sender)){
                 holderID++;
                uint256 itemId = holderID;
                idToHolders[itemId] =  Holders(
                  itemId,
                  msg.sender,
                  false  );
            }
            HoldersBook.push(msg.sender);
            return true;
        }
    
        else if (_allpeople) {
    
          uint256 supply = supplycount;  
          for (uint256 i = 1; i <= _qty; i++) {
            _safeMint(msg.sender, supply+i);
          }
          supplycount=supplycount+_qty;
          _holderEth.transfer(msg.value);
          _batch=_batch - _qty;
    
          if(!IfMinted(msg.sender)){
                 holderID++;
                uint256 itemId = holderID;
                idToHolders[itemId] =  Holders(
                  itemId,
                  msg.sender,
                  false  );
            }
            HoldersBook.push(msg.sender);
          
          return true;
    
          }
          return false;
      }
    
      function getHolders()public view  returns(Holders[] memory){
        uint itemCount = holderID;
        uint currentIndex = 0;
    
        Holders[] memory items = new Holders[](itemCount);
        for (uint i = 0; i < itemCount; i++) {
          if (idToHolders[i + 1].sold == false) {
            uint currentId = i + 1;
            Holders storage currentItem = idToHolders[currentId];
            items[currentIndex] = currentItem;
            currentIndex += 1;
          }
        }
        return items;
    
      }
    
      function giveAway(address _addr, uint256 _qty)  public onlyOwner {
          uint256 supply = supplycount;  
        for (uint256 i = 1; i <= _qty; i++) {
          _safeMint(_addr, supply+i);
        }
        supplycount=supplycount+_qty;
        
      }
    
      function changePrice(uint256 _newPrice)  public onlyOwner returns (bool) {
        price=_newPrice;
        return true;
      }
    
      function getPrice() public view returns (uint256) {
        return price;
      }
    
        function tokenURI(uint256 tokenId)public view virtual override returns (string memory)
      {
        require(_exists(tokenId),"ERC721Metadata: URI query for nonexistent token");
        string memory currentBaseURI = _baseURI();
        return bytes(currentBaseURI).length > 0 ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), baseExtension)) : "";
      }
    
      function pause() public onlyOwner {
            _pause();
        }
    
        function unpause() public onlyOwner {
            _unpause();
        }
    
        function _beforeTokenTransfer(address from, address to, uint256 tokenId)
            internal
            whenNotPaused
            override
        {
            super._beforeTokenTransfer(from, to, tokenId);
        }
    
        function transferFrom(
        address from, 
        address to, 
        uint256 tokenId
      ) public override {
    
        uint itemCount = holderID;
        for (uint i = 0; i < itemCount; i++) {
          if (idToHolders[i + 1].owner == msg.sender) {
              idToHolders[i + 1].owner = msg.sender;
              idToHolders[i + 1].sold = true;
          }
        }
         
         _transfer(from, to, tokenId);
      }
    
      function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
       ) public override {
    
        uint itemCount = holderID;
        for (uint i = 0; i < itemCount; i++) {
          if (idToHolders[i + 1].owner == msg.sender) {
              idToHolders[i + 1].owner = msg.sender;
              idToHolders[i + 1].sold = true;
          }
        }
         
         safeTransferFrom(from, to, tokenId, '');
       }
    
      function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
      ) public override {
    
        uint itemCount = holderID;
        for (uint i = 0; i < itemCount; i++) {
    
          if (idToHolders[i + 1].owner == msg.sender) {
              idToHolders[i + 1].owner = msg.sender;
              idToHolders[i + 1].sold = true;
              
          }
        }
         
        _safeTransfer(from, to, tokenId, _data);
      }
    
    }
