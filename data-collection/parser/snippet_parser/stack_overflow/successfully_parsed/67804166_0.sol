 

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/utils/Context.sol";

contract AFSE is ERC1155{
    mapping (uint256 => mapping(address => uint256)) internal _balances;
    mapping (uint256 => mapping(address => uint256)) internal mapof_urihash;
    address public creator; 
    event CreateToken(address creator, address owner, uint256 _id, uint256 _value,string uri, uint256 _urihash);

    constructor ()  ERC1155("netopen.pythonanywhere.com/static/metadados/metadadosparaerc1155.txt") {
        creator=msg.sender;
    }
}