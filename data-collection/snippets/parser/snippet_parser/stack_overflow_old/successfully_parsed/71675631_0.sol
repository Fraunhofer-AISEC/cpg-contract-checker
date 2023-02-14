

contract OwnableDelegateProxy { }

contract ProxyRegistry {
    mapping(address => OwnableDelegateProxy) public proxies;
}


contract TradeableERC721Token is ERC721Token, Ownable {
  using Strings for string;

  address proxyRegistryAddress;

  constructor(string _name, string _symbol, address _proxyRegistryAddress) ERC721Token(_name, _symbol) public {
    proxyRegistryAddress = _proxyRegistryAddress;
  }

  
  function mintTo(address _to) public onlyOwner {
    uint256 newTokenId = _getNextTokenId();
    _mint(_to, newTokenId);
  }

  
  function _getNextTokenId() private view returns (uint256) {
    return totalSupply().add(1);
  }

  function baseTokenURI() public view returns (string) {
    return "";
  }

  function tokenURI(uint256 _tokenId) public view returns (string) {
    return Strings.strConcat(
        baseTokenURI(),
        Strings.uint2str(_tokenId)
    );
  }

  
  function isApprovedForAll(
    address owner,
    address operator
  )
    public
    view
    returns (bool)
  {
    
    ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
    if (proxyRegistry.proxies(owner) == operator) {
        return true;
    }

    return super.isApprovedForAll(owner, operator);
  }
}




contract Creature is TradeableERC721Token {
  constructor(address _proxyRegistryAddress) TradeableERC721Token("Creature", "OSC", _proxyRegistryAddress) public {  }

  function baseTokenURI() public view returns (string) {
    return "https://gateway.pinata.cloud/ipfs/Qma9bHWfaCmSydmPokTodHLw6ec1Rv4nGTyTUWH8vwTxkd/";
  }
}




contract CreatureLootBox is TradeableERC721Token {
    uint256 NUM_CREATURES_PER_BOX = 3;
    uint256 OPTION_ID = 0;
    address factoryAddress;

    constructor(address _proxyRegistryAddress, address _factoryAddress) TradeableERC721Token("CreatureLootBox", "PUFFBOX", _proxyRegistryAddress) public {
        factoryAddress = _factoryAddress;
    }

    function unpack(uint256 _tokenId) public {
        require(ownerOf(_tokenId) == msg.sender);

        
        for (uint256 i = 0; i < NUM_CREATURES_PER_BOX; i++) {
            
            Factory factory = Factory(factoryAddress);
            factory.mint(OPTION_ID, msg.sender);
        }

        
        _burn(msg.sender, _tokenId);
    }

    function baseTokenURI() public view returns (string) {
        return "https://opensea-creatures-api.herokuapp.com/api/box/";
    }

    function itemsPerLootbox() public view returns (uint256) {
        return NUM_CREATURES_PER_BOX;
    }
}



contract CreatureFactory is Factory, Ownable {
  using Strings for string;

  address public proxyRegistryAddress;
  address public nftAddress;
  address public lootBoxNftAddress;
  string public baseURI = "https://gateway.pinata.cloud/ipfs/Qma9bHWfaCmSydmPokTodHLw6ec1Rv4nGTyTUWH8vwTxkd/";

  
  uint256 PUFF_SUPPLY = 100;

  
  uint256 NUM_OPTIONS = 3;
  uint256 SINGLE_PUFF_OPTION = 0;
  uint256 MULTIPLE_PUFF_OPTION = 1;
  uint256 LOOTBOX_OPTION = 2;
  uint256 NUM_PUFFS_IN_MULTIPLE_PUFF_OPTION = 4;

  constructor(address _proxyRegistryAddress, address _nftAddress) public {
    proxyRegistryAddress = _proxyRegistryAddress;
    nftAddress = _nftAddress;
    lootBoxNftAddress = new CreatureLootBox(_proxyRegistryAddress, this);
  }

  function name() external view returns (string) {
    return "OpenSeaCreature Item Sale";
  }

  function symbol() external view returns (string) {
    return "CPF";
  }

  function supportsFactoryInterface() public view returns (bool) {
    return true;
  }

  function numOptions() public view returns (uint256) {
    return NUM_OPTIONS;
  }
  
  function mint(uint256 _optionId, address _toAddress) public {
    
    ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
    assert(proxyRegistry.proxies(owner) == msg.sender || owner == msg.sender || msg.sender == lootBoxNftAddress);
    require(canMint(_optionId));

    Creature openSeaCreature = Creature(nftAddress);
    if (_optionId == SINGLE_PUFF_OPTION) {
      openSeaCreature.mintTo(_toAddress);
    } else if (_optionId == MULTIPLE_PUFF_OPTION) {
      for (uint256 i = 0; i < NUM_PUFFS_IN_MULTIPLE_PUFF_OPTION; i++) {
        openSeaCreature.mintTo(_toAddress);
      }
    } else if (_optionId == LOOTBOX_OPTION) {
      CreatureLootBox openSeaCreatureLootBox = CreatureLootBox(lootBoxNftAddress);
      openSeaCreatureLootBox.mintTo(_toAddress);
    } 
  }

  function canMint(uint256 _optionId) public view returns (bool) {
    if (_optionId >= NUM_OPTIONS) {
      return false;
    }

    Creature openSeaCreature = Creature(nftAddress);
    uint256 puffSupply = openSeaCreature.totalSupply();

    uint256 numItemsAllocated = 0;
    if (_optionId == SINGLE_PUFF_OPTION) {
      numItemsAllocated = 1;
    } else if (_optionId == MULTIPLE_PUFF_OPTION) {
      numItemsAllocated = NUM_PUFFS_IN_MULTIPLE_PUFF_OPTION;
    } else if (_optionId == LOOTBOX_OPTION) {
      CreatureLootBox openSeaCreatureLootBox = CreatureLootBox(lootBoxNftAddress);
      numItemsAllocated = openSeaCreatureLootBox.itemsPerLootbox();
    }
    return puffSupply < (PUFF_SUPPLY - numItemsAllocated);
  }
  
  function tokenURI(uint256 _optionId) public view returns (string) {
    return Strings.strConcat(
        baseURI,
        Strings.uint2str(_optionId)
    );
  }

  
  function transferFrom(address _from, address _to, uint256 _tokenId) public {
    mint(_tokenId, _to);
  }

  
  function isApprovedForAll(
    address _owner,
    address _operator
  )
    public
    view
    returns (bool)
  {
    if (owner == _owner && _owner == _operator) {
      return true;
    }

    ProxyRegistry proxyRegistry = ProxyRegistry(proxyRegistryAddress);
    if (owner == _owner && proxyRegistry.proxies(_owner) == _operator) {
      return true;
    }

    return false;
  }

  
  function ownerOf(uint256 _tokenId) public view returns (address _owner) {
    return owner;
  }
}
