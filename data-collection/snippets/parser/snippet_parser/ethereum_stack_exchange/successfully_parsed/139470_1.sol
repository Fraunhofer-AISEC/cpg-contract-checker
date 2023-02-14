
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

bytes32 constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

struct AppStorage {
    address tokenAddress;
}

contract MyContractFacet is AccessControl {

    AppStorage internal s;

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
        s.tokenAddress = _tokenAddress;
    }
}
