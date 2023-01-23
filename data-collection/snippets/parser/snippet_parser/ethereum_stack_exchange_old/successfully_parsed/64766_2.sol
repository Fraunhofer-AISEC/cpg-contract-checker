contract Test {
    uint public num;
    constructor(uint256 _num) public {
        num = _num;
    }
}

contract Call {
    Test test;
    function addTest(uint256 _newNum){
        test = new Test(_newNum)
    }
}
