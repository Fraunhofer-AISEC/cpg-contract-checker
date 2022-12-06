import {SafeMath} from "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract C {
    using SafeMath for uint256;

    uint256 public randomResult;

    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal {
        randomResult = randomness.mod(20).add(1);
    }
}
