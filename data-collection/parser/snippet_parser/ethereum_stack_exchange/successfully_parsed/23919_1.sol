pragma solidity ^0.4.11;

contract GoodAndBad {

    uint result = 0;
    event onResult(bool flag,uint result);

    function exec(uint flag) public returns (uint) {
        if (flag != 1) {
            result = 0;
            onResult(false,result);
            return;
        }
        result = 1;
        onResult(true,result);
        return result;
    }

}
