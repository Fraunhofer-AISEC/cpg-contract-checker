pragma solidity 0.5.1;

contract StringStorage {

    string[] public str;

    function push(string memory s) public {
        str.push(s);
    }

    function pop() public view returns(string memory s) {
        string storage _s = str[str.length-1]; 
        s = _s;
    }
}
