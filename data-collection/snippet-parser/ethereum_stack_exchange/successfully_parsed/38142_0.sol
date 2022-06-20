struct Test {
    address receiver;
    string date;
} 

mapping(address => Test[]) public testInfo;

function getTestInfo(address _account) public constant returns (Test[]) {
    return testInfo[_account];
}
