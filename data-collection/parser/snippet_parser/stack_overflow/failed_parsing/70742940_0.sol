pragma solidity 0.8.10;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/interfaces/IERC165.sol";
import "@openzeppelin/contracts/interfaces/IERC721.sol";
import "./IMintableERC721.sol";


contract MintablePresale is Ownable {
  
    using MerkleProof for bytes32[];

  uint32 public nextId = 1;

  uint32 public finalId;

  uint32 public batchLimit;

  uint32 public mintLimit;

  uint32 public soldCounter;

  
  bytes32 public root;

    uint256 public constant UID = 0x96156164645b31243986cb90a4oio09d99f140aa39d43ffa58a6af6d5e90bdbf4;

  address public immutable tokenContract;

  address public immutable developerAddress;

  mapping(address => uint32) public mints;

  
  event Initialized(
    address indexed _by,
    uint32 _nextId,
    uint32 _finalId,
    uint32 _batchLimit,
    uint32 _limit,
    bytes32 _root
  );

  event Bought(address indexed _by, address indexed _to, uint256 _amount, uint256 _value);

  constructor(address _tokenContract, address _developerAddress) {
    
    require(_tokenContract != address(0), "token contract is not set");

    
    require(
      IERC165(_tokenContract).supportsInterface(type(IMintableERC721).interfaceId)
      && IERC165(_tokenContract).supportsInterface(type(IMintableERC721).interfaceId),
      "unexpected token contract type"
    );

    
    tokenContract = _tokenContract;
    developerAddress = _developerAddress;
  }

  function itemsOnSale() public view returns(uint32) {
    
    
    return finalId > nextId? finalId + 1 - nextId: 0;
  }

  function itemsAvailable() public view returns(uint32) {
    
    return isActive() ? itemsOnSale(): 0;
  }

  function isActive() public view virtual returns(bool) {
    
    return nextId <= finalId;
  }

  

  function initialize(
    uint32 _nextId,  
    uint32 _finalId,  
    uint32 _batchLimit,  
    uint32 _mintLimit,  
    bytes32 _root  
  ) public onlyOwner {
    
    require(_nextId > 0, "zero nextId");

    

    
    
    
    
    if(_nextId != type(uint32).max) {
      nextId = _nextId;
    }
    
    if(_finalId != type(uint32).max) {
      finalId = _finalId;
    }
    
    if(_batchLimit != type(uint32).max) {
      batchLimit = _batchLimit;
    }
    
    if(_mintLimit != type(uint32).max) {
      mintLimit = _mintLimit;
    }
    
    if(_root != 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF) {
      root = _root;
    }

    
    emit Initialized(
      msg.sender,
      nextId,
      finalId,
      batchLimit,
      mintLimit,
      root
    );
  }

  
  function buy(uint256 _price, uint256 _start, uint256 _end, bytes32[] memory _proof, uint32 _amount) public payable {
    
    buyTo(msg.sender, _price, _start, _end, _proof, _amount);
  }

  
  function buyTo(address _to, uint256 _price, uint256 _start, uint256 _end, bytes32[] memory _proof, uint32 _amount) public payable {
    
    bytes32 leaf = keccak256(abi.encodePacked(msg.sender, _price, _start, _end));

    
    require(_proof.verify(root, leaf), "invalid proof");

    
    require(_to != address(0), "recipient not set");
    require(_amount > 1 && (batchLimit == 0 || _amount <= batchLimit), "incorrect amount");
    require(block.timestamp >= _start, "sale not yet started");
    require(block.timestamp <= _end, "sale ended");

    
    if(mintLimit != 0) {
      require(mints[msg.sender] + _amount <= mintLimit, "mint limit reached");
    }

    
    
    require(itemsAvailable() >= _amount, "inactive sale or not enough items available");

    
    uint256 totalPrice = _price * _amount;
    require(msg.value >= totalPrice, "not enough funds");

    
    IMintableERC721(tokenContract).mintBatch(_to, nextId, _amount);

    
    nextId += _amount;
    
    soldCounter += _amount;
    
    mints[msg.sender] += _amount;

    
    if(msg.value > totalPrice) {
      
      payable(msg.sender).transfer(msg.value - totalPrice);
    }

    
    emit Bought(msg.sender, _to, _amount, totalPrice);
  }

  
  function buySingle(uint256 _price, uint256 _start, uint256 _end, bytes32[] memory _proof) public payable {
    
    buySingleTo(msg.sender, _price, _start, _end, _proof);
  }

  
  function buySingleTo(address _to, uint256 _price, uint256 _start, uint256 _end, bytes32[] memory _proof) public payable {
    
    bytes32 leaf = keccak256(abi.encodePacked(msg.sender, _price, _start, _end));

    
    require(_proof.verify(root, leaf), "invalid proof");

    
    require(_to != address(0), "recipient not set");
    require(msg.value >= _price, "not enough funds");
    require(block.timestamp >= _start, "sale not yet started");
    require(block.timestamp <= _end, "sale ended");

    
    if(mintLimit != 0) {
      require(mints[msg.sender] + 1 <= mintLimit, "mint limit reached");
    }

    
    require(isActive(), "inactive sale");

    
    IMintableERC721(tokenContract).mint(_to, nextId);

    
    nextId++;
    
    soldCounter++;
    
    mints[msg.sender]++;

    
    emit Bought(msg.sender, _to, 1, _price);
  }

  }
}
