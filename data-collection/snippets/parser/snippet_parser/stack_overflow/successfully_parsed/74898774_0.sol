
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "./AdminContract.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin-contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";




contract Monion1155 is ERC1155, Ownable, Pausable, ERC2981, ERC1155Supply, ERC1155Holder, ERC1155MintBurn, ERC1155Metadata {

    
    event Minted (uint indexed tokenId,address indexed owner, uint quantity);

    address operator;
    AdminConsole admin;

}