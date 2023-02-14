contract Test {
    uint public myArray;

    function Test() public {
        myArray.push(1);
        myArray.push(10);
        myArray.push(30);
    }

    function getArrayLength() public view returns (uint) {
        return myArray.length;
    }

    function getFirstElement() public view returns (uint) {
        return myArray[0];
    }
}