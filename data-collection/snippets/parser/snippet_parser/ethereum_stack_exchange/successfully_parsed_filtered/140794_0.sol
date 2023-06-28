

pragma solidity ^0.8.0;

library IndexOf{
    function findIndex(uint[] storage arr, uint x) internal view returns(uint){
        for (uint i=0; i<arr.length; i++){
            if (arr[i] == x){
                return i;
            }
        }
        revert("index not found");
    } 
}

contract Freedom{
    uint[] arr = [3,2,1];
    using IndexOf for uint[];
    function testFind(uint x) external view returns(uint y ){
        return arr.findIndex(x);
    }
}
