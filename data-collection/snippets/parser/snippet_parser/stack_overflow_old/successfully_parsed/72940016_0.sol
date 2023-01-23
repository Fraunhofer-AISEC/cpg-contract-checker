contract TEST {
   
    struct testStruct {
        address[] testArr;
    }

    mapping(address => testStruct) public testMap;
  
    function addToStruct() public {
        test storage a = testMap[msg.sender];

        a.testArr.push(msg.sender);
    }

    function getStruct() public view returns(address[] memory){
        return testMap[msg.sender].testArr;
    }
}
