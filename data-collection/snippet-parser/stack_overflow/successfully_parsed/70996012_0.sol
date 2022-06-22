pragma solidity ^0.8.0;



import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract NFTXXX is ERC1155, Ownable {

    uint256 public constant Arcadiy = 0;
    uint256 public constant MAX = 1;

    constructor() ERC1155("http://ipfs.io/ipfs/{id}.json") {
        _mint(msg.sender, Arcadiy, 1, "");
        _mint(msg.sender, MAX, 2, "");
    }

    function mint(address account, uint256 id, uint256 amount) public onlyOwner {
        _mint(account, id, amount, "");
    }

    function burn(address account, uint256 id, uint256 amount) public {
        require(msg.sender == account);
        _burn(account, id, amount);

    }
}
