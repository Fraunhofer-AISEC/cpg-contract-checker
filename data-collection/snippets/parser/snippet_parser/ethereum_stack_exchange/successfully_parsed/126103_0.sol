pragma solidity 0.8.13;
contract A {
    function callBFunction( address _address) public returns (bool) {
        bytes4 sig = bytes4(keccak256("bFunction()"));
        (bool success,) = _address.call(
            abi.encodePacked(sig)
        );
        return success;
    }
}
contract B {
    uint256 public num = 4;
    function bFunciton()  public returns(uint256){
        num = 996;
        return num;
    }
}
