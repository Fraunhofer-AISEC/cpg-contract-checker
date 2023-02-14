pragma solidity =0.8.10;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract Child is AccessControl, Initializable {
    function initialize(address admin_) external initializer {}
}

contract Wrapper is AccessControl, Initializable {
    Child dc;

    event DataStored(address val);

    function assignRoles(address verify_, address account_) public {
        require(account_ != address(0), "0_ACCOUNT");
        dc = Child(verify_);

        emit DataStored(address(dc));
    }
}
