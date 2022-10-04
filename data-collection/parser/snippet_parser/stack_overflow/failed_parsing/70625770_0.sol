
pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin- 
contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";

contract NFTContract is ERC1155 {
    uint256 public constant Jack = 0;

    constructor() ERC1155("") {
        _mint(msg.sender, Jack, 0, "");
    }

    function mint(address account, uint256 id, uint256 amount) public payable {
        payable(address(0xdD870fA1b7C4700F2BD7f44238821C26f7392148)).transfer(100000000000000000);
        _mint(account, id, amount, "");
    }
}
