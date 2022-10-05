contract Test 
{

    uint256 public testNum;
    address public owner;

    constructor () public 
    {
        owner = msg.sender;
        testNum = 1;
    }



    function returnTrueIfGreaterThanTen()
        public view returns(bool)
    {
        require(testNum > 10);
        return true;
    }
    
    function setTestNum(uint256 _newNum) 
        onlyOwner
    {
        testNum = _newNum;
    }
}
