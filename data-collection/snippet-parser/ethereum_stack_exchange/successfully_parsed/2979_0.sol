contract testConstant{
string testString;

function testConstant(string _testString) {
    testString=_testString;
}
function gettestString() public constant returns(string) {
    return testString;
}
}
