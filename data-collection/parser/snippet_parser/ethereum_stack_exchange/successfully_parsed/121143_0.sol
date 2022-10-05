
pragma solidity ^0.8.0;

contract input_string {
string data;

function input_data(string memory _data) public returns (bool _success) {
    data = _data;
    return true;
 }

function see_data() public view returns(string memory) {
    return data;
 }

}
