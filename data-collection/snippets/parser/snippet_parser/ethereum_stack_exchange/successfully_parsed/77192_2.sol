contract Test {

    uint256 public testNum;
    uint256 public historicTestNum;
    address public owner;

    constructor () public 
    {
        owner = msg.sender;
        testNum = 1;
        historicTestNum = 1;
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
        if (block.number <= 90) {
            historicTestNum = testNum;
        }
    }

    function returnTrueIfHistoricGreaterThanTen()
        public view returns(bool)
    {
        return (block.number > 90 && historicTestNum > 10);
    }

}
