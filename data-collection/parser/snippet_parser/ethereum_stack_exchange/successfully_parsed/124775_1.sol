pragma solidity >=0.7.0 <0.9.0;

import "./IERC165.sol";
import "./IERC721.sol";
import "./IERC721Enumerable.sol";
import "./ERC165.sol";
import "./Strings.sol";
import "./Address.sol";
import "./IERC721Metadata.sol";
import "./IERC721Receiver.sol";
import "./ERC721.sol";
import "./ERC721Enumerable.sol";
import "./Ownable.sol";

contract NFTContracts is ERC721Enumerable, Ownable {
  using Strings for uint256;

  string baseURI; 
  string linkURL;
  string public baseExtension = ".json";
  uint256 public cost; 
  uint256 public maxMintAmount = 1;
  bool public isInVault = false;

  constructor(
    string memory _name,
    string memory _symbol,
    string memory _initBaseURI
  ) ERC721(_name, _symbol) {
    setBaseURI(_initBaseURI);
  }

  
  function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
  }
}