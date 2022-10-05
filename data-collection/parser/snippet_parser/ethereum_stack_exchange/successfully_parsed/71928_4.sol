import "./SafeMath.sol";

contract Percentage{
    
    uint256 public basePercent = 100;

    function onePercent(uint256 _value) public view returns (uint256)  {
        uint256 roundValue = SafeMath.ceil(_value, basePercent);
        uint256 onePercent = SafeMath.div(SafeMath.mul(roundValue, basePercent), 10000);
        return onePercent;
    }
}
