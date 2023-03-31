
pragma solidity >=0.8.17;
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract Test is VRFConsumerBase {
    uint256 public _randomSeed;
    bytes32 internal keyHash;

    
    constructor(address _vrfCoordinator, address _link)
        VRFConsumerBase(_vrfCoordinator, _link) {
            keyHash = 0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c;
    }

    function getRandomNumber()
        public
        returns (bytes32) {
            uint256 _fee = 25 * (10 ** 16); 
            if (LINK.balanceOf(address(this)) < _fee) {
                revert("Inadequate Link to fund this transaction");
            }
            return requestRandomness(keyHash, _fee);
    }

    function fulfillRandomness(bytes32 , uint256 randomness)
        internal
        override {
           _randomSeed = randomness;
    }

    function withdraw()
    external {
        bool success = LINK.transfer(msg.sender, LINK.balanceOf(address(this)));
        if (!success) {
            revert("withdrawLINK() PaymentFailure1");
        }
    }
}
