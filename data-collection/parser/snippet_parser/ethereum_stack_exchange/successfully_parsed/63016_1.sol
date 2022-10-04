pragma solidity >=0.4.0;
contract MyTest {

    function isFalse() internal pure returns (bool) {
        revert();
        return false;
    }

    function isTrue() internal pure returns (bool) {
        revert();
        return true;
    }

    function test() public pure {
        if (true || isFalse()) {
            
        }
        if (false && isTrue()) {
            revert();
        }
    }
}
