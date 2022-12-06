pragma solidity ^0.5.0;

import "@openzeppelin/contracts/utils/Context.sol";


 import "./IERC721.sol";
 import "./IERC721Receiver.sol";
 import "../../math/SafeMath.sol";
 import "../../utils/Address.sol";
 import "../../drafts/Counters.sol";
 import "../../introspection/ERC165.sol";


 contract ERC721 is  Context, ERC165, IERC721 {
 using SafeMath for uint256;
 using Address for address;
 using Counters for Counters.Counter;

 
 
 bytes4 private constant _ERC721_RECEIVED = 0x150b7a02;
}