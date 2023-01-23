import "./SafeMath.sol";

contract TestSafeMath {
    using SafeMath for uint256;

    function unsafeSubtract() public pure returns (uint256) {
        uint256 a = 0;
        return a - 1;
    }

    function safeSubtract() public pure returns (uint256) {
        uint256 a = 0;
        return a.sub(1);
    }
}
