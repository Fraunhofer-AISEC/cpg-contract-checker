

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VasikTest is ERC721Enumerable, Ownable {  
    using Address for address;

    string public uriPrefix = "";
    string public uriSuffix = ".json";
    string public hiddenMetadataUri;
    
    
    bool public saleActive = false;
    bool public whitelistActive = false;
    bool public presaleActive = false;
    bool public revealed = false;


    
    uint256 public reserved = 2;

    
    uint256 public initial_price = 0.001 ether;
    uint256 public price;

    
    uint256 public constant MAX_SUPPLY = 10;
    uint256 public constant MAX_PRESALE_SUPPLY = 5;
    uint256 public constant MAX_MINT_PER_TX = 2;


    
    address public a1;
    address public a2;
    address public a3;

    
    mapping (address => uint256) public whitelistReserved;


    constructor () ERC721 ("Vasik One mint v2", "OneMintVasik") {
        price = initial_price;
        setHiddenMetadataUri("ipfs://QmVntyJMSn8FxYVHtWig3qtfFed5aH1mr7EeXx1nespWpu/hidden.json");
    }

    function tokenURI(uint256 _tokenId)
    public
    view
    virtual
    override
    returns (string memory)
  {
    require(
      _exists(_tokenId),
      "ERC721Metadata: URI query for nonexistent token"
    );

    if (revealed == false) {
      return hiddenMetadataUri;
    }

    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0
        ? string(abi.encodePacked(currentBaseURI, Strings.toString(_tokenId), uriSuffix))
        : "";
  }

    
    function tokensOfOwner(address addr) public view returns(uint256[] memory) {
        uint256 tokenCount = balanceOf(addr);
        uint256[] memory tokensId = new uint256[](tokenCount);
        for(uint256 i = 0; i < tokenCount; i++){
            tokensId[i] = tokenOfOwnerByIndex(addr, i);
        }
        return tokensId;
    }

    

    
    function mintWhitelist(uint256 _amount) public payable {
        uint256 supply = totalSupply();
        uint256 reservedAmt = whitelistReserved[msg.sender];
        require( whitelistActive,                   "Whitelist isn't active" );
        require( reservedAmt > 0,                   "No tokens reserved for your address" );
        require( _amount <= reservedAmt,            "Can't mint more than reserved" );
        require( supply + _amount <= MAX_SUPPLY,    "Can't mint more than max supply" );
        require( msg.value == price * _amount,      "Wrong amount of ETH sent" );
        whitelistReserved[msg.sender] = reservedAmt - _amount;
        for(uint256 i = 0; i < _amount; i++){
            _safeMint( msg.sender, supply + i );
        }
    }

    
    function mintPresale(uint256 _amount) public payable {
        uint256 supply = totalSupply();
        require( presaleActive,                             "Sale isn't active" );
        require( _amount > 0 && _amount <= MAX_MINT_PER_TX, "Can only mint between 1 and 20 tokens at once" );
        require( supply + _amount <= MAX_PRESALE_SUPPLY,    "Can't mint more than max supply" );
        require( msg.value == price * _amount,              "Wrong amount of ETH sent" );
        for(uint256 i = 0; i < _amount; i++){
            _safeMint( msg.sender, supply + i );
        }
    }

    
    function mintToken(uint256 _amount) public payable {
        uint256 supply = totalSupply();
        require( saleActive,                                "Sale isn't active" );
        require( _amount > 0 && _amount <= MAX_MINT_PER_TX, "Can only mint between 1 and 10 tokens at once" );
        require( supply + _amount <= MAX_SUPPLY,            "Can't mint more than max supply" );
        require( msg.value == price * _amount,              "Wrong amount of ETH sent" );
        for(uint256 i = 0; i < _amount; i++){
            _safeMint( msg.sender, supply + i );
        }
    }

    
    function mintReserved(uint256 _amount) public onlyOwner {
        
        require( _amount <= reserved, "Can't reserve more than set amount" );
        reserved -= _amount;
        uint256 supply = totalSupply();
        for(uint256 i = 0; i < _amount; i++){
            _safeMint( msg.sender, supply + i );
        }
    }
    
    
    function editWhitelistReserved(address[] memory _a, uint256[] memory _amount) public onlyOwner {
        for(uint256 i = 0; i < _a.length; i++){
            whitelistReserved[_a[i]] = _amount[i];
        }
    }

    

    
    function setWhitelistActive(bool val) public onlyOwner {
        whitelistActive = val;
    }

    
    function setPresaleActive(bool val) public onlyOwner {
        presaleActive = val;
    }

    
    function setSaleActive(bool val) public onlyOwner {
        saleActive = val;
    }

      function setHiddenMetadataUri(string memory _hiddenMetadataUri) public onlyOwner {
    hiddenMetadataUri = _hiddenMetadataUri;
  }

  function setUriPrefix(string memory _uriPrefix) public onlyOwner {
    uriPrefix = _uriPrefix;
  }

  function setUriSuffix(string memory _uriSuffix) public onlyOwner {
    uriSuffix = _uriSuffix;
  }

    function setRevealed(bool _state) public onlyOwner {
    revealed = _state;
    }

    
    function setPrice(uint256 newPrice) public onlyOwner {
        price = newPrice;
    }

    
    function setAddresses(address[] memory _a) public onlyOwner {
        a1 = _a[0];
        a2 = _a[1];
        a3 = _a[2];
    }

    
    function withdrawTeam(uint256 amount) public payable onlyOwner {
        uint256 percent = amount / 100;
        require(payable(a1).send(percent * 40));
        require(payable(a2).send(percent * 40));
        require(payable(a3).send(percent * 20));
    }

    function _baseURI() internal view virtual override returns (string memory) {
    return uriPrefix;
  }
}
