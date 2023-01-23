import "./xDAI.sol";

contract TestDAI is xDAI {
    uint256 public time = 1;

    function _now() internal view override returns (uint256) {
        return time;
    }

    function setTime(uint256 _time) public {
        time = _time;
    }
}
