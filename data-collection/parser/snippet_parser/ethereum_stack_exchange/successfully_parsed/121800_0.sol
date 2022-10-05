

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "@openzeppelin/contracts/access/Ownable.sol";

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract test is ERC721URIStorage, Ownable {

using Strings for uint256;

constructor() ERC721("TEST", "TEST") {}

function viewBalance() external view returns (uint256) {return IERC1155(contractAddress).balanceOf(userAddress,tokenID);}

}
