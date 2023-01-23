pragma solidity >=0.5.0 <0.6.0;

library MyLib {
    bytes1 public constant AWESOME_FLAG = 0x01;
}

contract MyContract {
    function getFlag() public returns (bytes1) {
        return MyLib.AWESOME_FLAG;
    }
}
