
pragma solidity 0.6.12;

import "./Initializable.sol";
import "./VRFConsumerBaseUpgradable.sol";

contract Sample is Initializable, VRFConsumerBaseUpgradable {

    bytes32 internal keyHash;
    uint256 internal fee;
    
    address private owner;
    
    function initialize(address _owner)
        public
        initializer
    {
        VRFConsumerBaseUpgradable.initialize(
            0xa555fC018435bef5A13C6c6870a9d4C11DEC329C, 
            0x84b9B910527Ad5C03A9Ca831909E21e236EA7b06  
        );

        keyHash = 0xcaf3c3727e033261d383b315559476f48034c13b18f8cafed4d871abe5049186;
        fee = 0.1 * 10 ** 18; 
        
        owner = _owner;
    }

    function getRandomNumber(uint256 userProvidedSeed) public returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
        return requestRandomness(keyHash, fee, userProvidedSeed);
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        
    }

    ...
    
}
