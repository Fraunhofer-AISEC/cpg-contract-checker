
pragma solidity ^0.7.0;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./ServicePayer.sol";

contract StandardERC20 is ERC20, ServicePayer {

    constructor (
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 initialBalance,
        address payable feeReceiver
    ) ERC20(name, symbol) ServicePayer(feeReceiver, "StandardERC20") payable {
        require(initialBalance > 0, "StandardERC20: supply cannot be zero");

        _setupDecimals(decimals);

        _mint(_msgSender(), initialBalance);
    }
}
