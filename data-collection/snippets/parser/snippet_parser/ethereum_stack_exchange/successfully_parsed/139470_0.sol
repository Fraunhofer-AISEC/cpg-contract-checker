
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyContract is AccessControl {

    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    address public tokenAddress;

    modifier onlyAdmin() {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "Caller is not admin");
        _;
    }

    constructor(address _admin) {
        _setupRole(DEFAULT_ADMIN_ROLE, _admin);
        _setupRole(PAUSER_ROLE, _admin);
    }

    function setTokenAddress(address _tokenAddress)
        external
        onlyAdmin
    {
        tokenAddress = _tokenAddress;
    }
}
