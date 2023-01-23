pragma solidity ^0.4.2;
import "global_functions.sol";
contract strtest
{
    bool ib_equal;
    function test(string p1,string p2) returns(bool) {
        ib_equal = strcompare(p1,p2) ;
        return true;
    }
}
