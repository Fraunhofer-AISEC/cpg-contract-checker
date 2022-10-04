pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
contract NFT is ERC1155 {
    using SafeMath for uint256;

constructor() ERC1155("ipfs://<hash>/metadata/{id}.json") {
    _mint(msg.sender, 0, 1, "");
    _mint(msg.sender, 1, 1, "");
    _mint(msg.sender, 2, 1, "");
    _mint(msg.sender, 3, 1, "");
}
}