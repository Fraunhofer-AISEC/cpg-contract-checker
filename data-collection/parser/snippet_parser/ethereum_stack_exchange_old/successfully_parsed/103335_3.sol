contract ReadingContract {
    Test test;
    
    constructor (address _test_address) {
        test = Test(_test_address);
    }
    
    function getTestContractStadiums(uint256 _index) public view returns(string memory, uint256) {
        return test.returnStadium(_index);
    }
}
