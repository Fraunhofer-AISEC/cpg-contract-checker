pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    address public creatorAddress = 0xYOUR_ADDRESS;

    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public payable {
        _mint(to, amount);

        payable(creatorAddress).transfer(msg.value / 10);
    }
}
