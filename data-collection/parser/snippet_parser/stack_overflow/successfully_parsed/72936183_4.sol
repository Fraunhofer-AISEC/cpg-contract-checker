import "./Lib.sol";
library LibTest {
    function testLibFunc() public view returns(bool) {
        bool response = Lib.testFunc();
        return response;
    }
}
