import "@openzeppelin/contracts/access/AccessControl.sol";
import "./Example.sol";

contract ExampleFactory is AccessControl {
  

  bool public ONLY_WHITELISTED = true;
  uint256 public PRESALE_COST = 6700000 gwei;
  uint256 public SALE_COST = 13400000 gwei;
  uint256 MAX_PRESALE_MINT = 2;
  uint256 MAX_LIVE_MINT = 10;
  uint256 TOTAL_SUPPLY = 100;

  

  bytes32 public constant ROLE_MINTER = keccak256("ROLE_MINTER");
  bytes32 public constant ROLE_PRESALE = keccak256("ROLE_PRESALE");
  
  

  constructor(address _nftAddress) {
    nftAddress = _nftAddress;

    
    
    _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    _setupRole(ROLE_MINTER, msg.sender);
    _setupRole(ROLE_PRESALE, msg.sender);
  }

  function mint(uint256 _mintAmount, address _toAddress) public payable {
    
    if (hasRole(ROLE_MINTER, msg.sender) == false) {
        if (ONLY_WHITELISTED == true) {
            
            require(hasRole(ROLE_PRESALE, msg.sender), "address is not whitelisted");
            require(msg.value >= PRESALE_COST * _mintAmount, "tx value too low for quantity");
        } else {
            require(msg.value >= SALE_COST * _mintAmount, "tx value too low for quantity");
        }
    }

    
    require(canMint(_mintAmount), "remaining supply too low");

    Example token = Example(nftAddress);
    for (uint256 i = 0; i < _mintAmount; i++) {
        token.mintTo(_toAddress);
    }
  }

  function canMint(uint256 _mintAmount) public view returns (bool) {
    if (hasRole(ROLE_MINTER, msg.sender) == false) {
        if (ONLY_WHITELISTED == true) {
            require((_mintAmount <= MAX_PRESALE_MINT), "max 2 tokens can be minted during presale");
        } else {
            require((_mintAmount <= MAX_LIVE_MINT), "max 10 tokens can be minted during sale");
        }
    }

    Example token = Example(nftAddress);
    uint256 issuedSupply = token.totalSupply();
    return issuedSupply < (TOTAL_SUPPLY - _mintAmount);
  }
}
