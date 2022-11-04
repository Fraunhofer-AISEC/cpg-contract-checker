pragma solidity ^0.4.24;
import "./Second.sol";

contract First {
    Second private _oSecond;
    int32 public _nRes1;

    constructor(address oSecond) public payable {
        _oSecond = Second(oSecond);
        _nRes1 = 3;
    }
    function TestError() public {
        _oSecond.State();
        
        _nRes1 = 5;
    }
}
