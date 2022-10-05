pragma solidity ^0.8.0;

import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import '@openzeppelin/contracts/token/ERC721/IERC721.sol';
import '@openzeppelin/contracts/security/ReentrancyGuard.sol';
import '@openzeppelin/contracts/utils/Counters.sol';
import './interfaces/IDeployableCollection.sol';

contract DeployableCollection is IDeployableCollection, ERC721URIStorage, ReentrancyGuard {
  using Counters for Counters.Counter;

  Counters.Counter private _tokenIds;
  address public _collectionOwner;
  bytes32 public _category;
  address payable public _paymentReceiver;
  string public _collectionURI;
  mapping(address => uint256) public lastMintedForIDs;

  constructor(
    string memory name_,
    string memory symbol_,
    address collectionOwner_,
    string memory category_,
    address paymentReceiver_,
    string memory collectionURI_
  ) ERC721(name_, symbol_) {
    _collectionOwner = collectionOwner_;
    _category = keccak256(abi.encode(category_));
    _paymentReceiver = payable(paymentReceiver_);
    _collectionURI = collectionURI_;
  }

  function mintFor(string memory _tokenURI, address to) external nonReentrant returns (uint256 _tokenId) {
    _tokenIds.increment();
    _tokenId = _tokenIds.current();
    _mint(to, _tokenId);
    _setTokenURI(_tokenId, _tokenURI);
    lastMintedForIDs[to] = _tokenId;
  }
}
