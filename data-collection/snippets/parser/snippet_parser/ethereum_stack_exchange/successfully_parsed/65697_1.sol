pragma solidity 0.5.2;

contract SimpleStore {
    uint256 public value;
    address public addr;

    function set(address[] calldata _addr, uint256[] calldata _value) external {
        value = _value[0];
        addr = _addr[0];
    }

    function get() external view returns (uint256) {
        return value;
    }
}
