
pragma solidity ^0.8.0;

import "solidstate/contracts/access/access_control/AccessControl.sol";
import { AccessControlStorage } from "solidstate/contracts/access/access_control/AccessControlStorage.sol";

bytes32 constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

struct AppStorage {
    address tokenAddress;
}

contract MyContractFacet is AccessControl {
    AppStorage internal s;

    function initialize(address _admin) external {
        _grantRole(AccessControlStorage.DEFAULT_ADMIN_ROLE, _admin);
        _grantRole(PAUSER_ROLE, _admin);
    }

    modifier onlyAdmin() {
        require(_hasRole(AccessControlStorage.DEFAULT_ADMIN_ROLE, msg.sender), "Caller is not admin");
        _;
    }

    function setTokenAddress(address _tokenAddress)
        external
        onlyAdmin
    {
        s.tokenAddress = _tokenAddress;
    }

}
