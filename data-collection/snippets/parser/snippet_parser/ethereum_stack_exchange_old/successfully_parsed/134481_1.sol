
pragma solidity 0.8.15;

contract ContractLogic {
    uint256 public count;
    address public contractLogic;

    function setCount(uint256 _count) external {
        count = _count + 2;
    }
}
