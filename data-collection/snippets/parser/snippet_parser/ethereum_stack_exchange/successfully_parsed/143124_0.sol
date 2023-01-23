import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Random {
    using SafeMath for uint256;

    uint256 a = 5;
    uint256 b = 6;

    function addNumbers() public view returns (uint256) {
        return a.add(b);
    }
}
