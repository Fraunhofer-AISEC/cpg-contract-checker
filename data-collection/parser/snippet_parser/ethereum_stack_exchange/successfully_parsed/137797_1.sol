
pragma solidity 0.8.7;

contract Arrayelement{

    uint[] public arr;

    function set() public {
        for(uint i=0; i<10; i++) {
            arr.push(i+1);
        }
    }

    function get() public view returns(uint[] memory array) {
        return arr;
    }

    function remove(uint _index) public {
        require(_index < arr.length, "Index out of bounds");
        for(uint i = _index ; i < arr.length-1; i++){
            arr[i] = arr[i+1];
        }
        arr.pop();
    }
}
