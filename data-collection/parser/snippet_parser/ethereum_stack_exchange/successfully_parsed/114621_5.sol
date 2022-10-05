
pragma solidity ^0.5.0;

contract Case2 {
     struct Test { uint256 value; }

     Test[] public myArray;

     event myEvent(uint256);

    function testCase2() public {
        myArray.push(Test({value: 10}));

        
        
        Test storage lastItem = myArray[myArray.length - 1];

        
        emit myEvent(lastItem.value);
        
        
        
        myArray.length--;

        
        emit myEvent(lastItem.value);
    }
}
