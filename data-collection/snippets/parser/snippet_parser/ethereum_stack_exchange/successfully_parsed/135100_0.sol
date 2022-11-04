pragma solidity ^0.5.1;

contract Max_Array{

    uint[]  myArray;
    uint val = 0;
    uint j=0;

    function push(uint i) public {
        myArray.push(i);
    }

    function getArray() public view returns(uint[]  memory) {
        return myArray;
    }

    function getLargest() public returns(uint){        
        for(j=0;j<myArray.length;j++){
            if (myArray[j]>val){
                val = myArray[j];
            }
        }
        return val;
    }
}
