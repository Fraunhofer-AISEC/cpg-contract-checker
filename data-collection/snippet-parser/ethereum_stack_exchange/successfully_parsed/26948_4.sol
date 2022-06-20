pragma solidity ^0.5.0;
contract TestConversion {
    int256 val;
    function set(bytes32 _val) public {
        val = int256(_val);
    }
    function get() public view returns(int256){
        return val;
    }
}
