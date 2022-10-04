import "./Owned.sol";

contract B is Owned {
    constructor() public {
        
        ...
    }

    function _authorizeCaller(address addr) external requireContractOwner {
        ...
    }
}
