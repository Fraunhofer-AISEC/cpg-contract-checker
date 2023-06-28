
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC777/ERC777.sol";

contract Implementation is ERC777 {
    constructor(
        string memory rewardTokenName,
        string memory rewardTokenSymbol,
        address[] memory owners
    ) ERC777(rewardTokenName, rewardTokenSymbol, owners) {}

    function mint(address account, uint256 amount) external {
        require(isOperatorFor(_msgSender(), address(0)), "not contract owner");
        _mint(account, amount, "", "");
    }
}
