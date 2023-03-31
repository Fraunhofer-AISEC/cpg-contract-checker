
pragma solidity ^0.8.18;

import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";

abstract contract VRFSetup {
    VRFCoordinatorV2Interface COORDINATOR;
    LinkTokenInterface LINKTOKEN;

    address internal _coordinator = 0x6A2AAd07396B36Fe02a22b33cf443582f682c82f;

    address internal _link = 0x84b9B910527Ad5C03A9Ca831909E21e236EA7b06;

    bytes32 internal _keyHash = 0xd4bb89654db74673a187bd804519e65e3f71a52bc55f11da7601a13dcf505314;

    uint64 internal _subscriptionid = xxxx; 
    
    address internal _owner;

    constructor() {
        COORDINATOR = VRFCoordinatorV2Interface(_coordinator);
        LINKTOKEN = LinkTokenInterface(_link);
        _owner = msg.sender;
    }

    
    function owner() external view returns(address) {
        return _owner;
    }

    
    function addressOf() external view returns(address) {
        return address(this);
    }

    modifier onlyOwner {
        require(msg.sender == _owner, "Only Owner Callable");
        _;
    }
}
