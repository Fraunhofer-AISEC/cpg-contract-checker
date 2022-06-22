pragma solidity ^0.4.23;
pragma experimental ABIEncoderV2;
contract PQ {
struct Node {
    int256 key;
    address value;
}    
Node[7] private heapKeyValue;   
function insert(int256 key, address addr) public {
      .. Implementation ..
}
function get_min() public view returns (int256) {
    return heapKeyValue[0].key;
}
function heapify(uint8 idx) internal {
      ..Implementation..
}
}
