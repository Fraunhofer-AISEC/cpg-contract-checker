pragma solidity 0.6.0;


contract TestStamps {

    uint256 time;
    bool test;

    constructor() public {
        time = now;
    }

    function getTime() public view returns (uint256) {
        return time;
    }

    function updateBlock() public  {
        time = now;
    }

    function doLogic() public {
        if (now > time) {
            test = true;
        } else {
            test = false;
        }
    }

    function getTestBool () public view returns (bool) {
        return test;
    }
}
