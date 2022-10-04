contract TestContract{

    uint testUint;

    function testFunc() public view returns(uint[]){
        uint[] memory testArr = new uint[](1);
        testArr[0]++;   
        testUint++;     
        return testArr;
    }    
}
