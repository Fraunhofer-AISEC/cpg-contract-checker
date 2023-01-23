pragma solidity ^0.4.20;

contract Test {

    uint[4] public arr; 
    event TestLog(string logmessage);

    function Test() public {
        arr[0] = 1; 
    }

    function checkArray() public {
        if(arr[0] == 1) { 
            arr[1] = 1;
            arr[0] = 0; 
        }
        TestLog("some log");
    }

}
