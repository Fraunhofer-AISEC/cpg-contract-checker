import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Random2 {
    uint256 a = 5;
    uint256 b = 6;
    
    function addNumbers() public view returns (uint256) {
        return SafeMath.add(a, b);
    }
}
