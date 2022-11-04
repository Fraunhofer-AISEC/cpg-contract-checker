
pragma solidity 0.8.7;

contract Arrayelement{
    
    

    uint[] public arr;

    function remove(uint _index) public {
        require(_index < arr.length, "Index out of bounds");
        for(uint i = _index ; i < arr.length-1; i++){
            arr[i] = arr[i+1];
        }
        arr.pop();
    }

    function testremove() public {
        arr = [1,2,3,4,5];
        remove(2);
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);
    }

    function get() public view {
           }
}
