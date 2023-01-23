
pragma solidity 0.8.15;

contract Proxy {
    uint256 public count;
    address public contractLogic;

    function setAddress(address _addr) external {
        contractLogic = _addr;
    }

    function setCount(uint256 _count) external{
       (bool success, ) = 
       contractLogic.delegatecall(abi.encodeWithSignature("setCount(uint256)", _count));
    }
}
