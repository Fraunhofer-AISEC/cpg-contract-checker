

line 1443 ignore this
contract Eight Founding Fathers is ERC721A, Ownable, ReentrancyGuard {

  string public        baseURI;
  uint public          price             = 0.003 ether;
  uint public          maxPerTx          = 20;
  uint public          totalFree         = 1000;
  uint public          maxSupply         = 1776;
  uint256 public       maxFreePerWallet = 3;
  bool public          mintEnabled;
  mapping(address => uint256) private _mintedFreeAmount;

  constructor() ERC721A("8Bit Founding Fathers","8BFF"){}
