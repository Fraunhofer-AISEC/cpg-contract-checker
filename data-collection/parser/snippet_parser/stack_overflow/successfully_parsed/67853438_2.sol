
pragma solidity 0.6.12;

import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

import "@chainlink/contracts/src/v0.6/interfaces/LinkTokenInterface.sol";

import "@chainlink/contracts/src/v0.6/VRFRequestIDBase.sol";

abstract contract VRFConsumerBaseUpgradable is VRFRequestIDBase {

  using SafeMathChainlink for uint256;

  function fulfillRandomness(bytes32 requestId, uint256 randomness)
    internal virtual;

  function requestRandomness(bytes32 _keyHash, uint256 _fee, uint256 _seed)
    internal returns (bytes32 requestId)
  {
    LINK.transferAndCall(vrfCoordinator, _fee, abi.encode(_keyHash, _seed));
    
    uint256 vRFSeed  = makeVRFInputSeed(_keyHash, _seed, address(this), nonces[_keyHash]);
    
    nonces[_keyHash] = nonces[_keyHash].add(1);
    return makeRequestId(_keyHash, vRFSeed);
  }

  
  LinkTokenInterface internal LINK;
  
  address private vrfCoordinator;

  mapping(bytes32  => uint256 ) private nonces;

  
  function initialize(address _vrfCoordinator, address _link) public {
    vrfCoordinator = _vrfCoordinator;
    LINK = LinkTokenInterface(_link);
  }

  function rawFulfillRandomness(bytes32 requestId, uint256 randomness) external {
    require(msg.sender == vrfCoordinator, "Only VRFCoordinator can fulfill");
    fulfillRandomness(requestId, randomness);
  }

}
