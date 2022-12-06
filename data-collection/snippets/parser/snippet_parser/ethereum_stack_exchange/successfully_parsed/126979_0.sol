

pragma solidity >=0.8.9 <0.9.0;

import 'erc721a/contracts/ERC721A.sol';
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/utils/cryptography/MerkleProof.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';

contract ERC721A is ERC721A, Ownable, ReentrancyGuard {

  using Strings for uint256;

  bytes32 public merkleRoot;
  mapping(address => bool) public whitelistClaimed;

  string public uriPrefix = '';
  string public uriSuffix = '.json';
  string public hiddenMetadataUri;
  
  uint256 public cost;
  uint256 public maxSupply;
  uint256 public maxMintAmountPerTx;

  bool public paused = true;
  bool public whitelistMintEnabled = false;
  bool public revealed = false;

  address public a1;
  address public a2;

  address tokenAddress;


  constructor(
    address _tokenAddress,
    string memory _tokenName,
    string memory _tokenSymbol,
    uint256 _cost,
    uint256 _maxSupply,
    uint256 _maxMintAmountPerTx,
    string memory _hiddenMetadataUri
  ) ERC721A(_tokenName, _tokenSymbol) {
    tokenAddress = _tokenAddress;
    setCost(_cost);
    maxSupply = _maxSupply;
    setMaxMintAmountPerTx(_maxMintAmountPerTx);
    setHiddenMetadataUri(_hiddenMetadataUri);
  }

    modifier callerIsUser() {
        require(tx.origin == msg.sender, "The caller is another contract");
        _;
    }

  modifier mintCompliance(uint256 _mintAmount) {
    require(_mintAmount > 0 && _mintAmount <= maxMintAmountPerTx, 'Invalid mint amount!');
    require(totalSupply() + _mintAmount <= maxSupply, 'Max supply exceeded!');
    _;
  }

  modifier mintPriceCompliance(uint256 _mintAmount) {
    require(msg.value >= cost * _mintAmount, 'Insufficient funds!');
    _;
  }

     function GetUserTokenBalance() public view returns(uint256){ 
       return tokenAddress.balanceOf(msg.sender);
   }

    function Approvetokens(uint256 _tokenamount) public returns(bool){
       tokenAddress.approve(address(this), _tokenamount);
       return true;
   }

     function GetAllowance() public view returns(uint256){
       return tokenAddress.allowance(msg.sender, address(this));
   }

    function mint(uint256 _tokenamount,uint256 _mintAmount) public returns(bool) {
    require(_tokenamount > GetAllowance(), "Please approve tokens before transferring");
    ERC20(tokenAddress).transferFrom(msg.sender, address(this), _tokenamount);
    _safeMint(_msgSender(), _mintAmount);
    return true;
    }

    function GetContractTokenBalance() public onlyOwner view returns(uint256){
    return token.balanceOf(address(this));
   }
}