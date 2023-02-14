pragma solidity >=0.7.0 <0.9.0;

contract test {
     uint256 public store;
    function changeValue(uint256 input)public {
        store = input;
    }
}
