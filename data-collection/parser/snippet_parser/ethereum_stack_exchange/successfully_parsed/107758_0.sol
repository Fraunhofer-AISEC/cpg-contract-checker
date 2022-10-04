pragma solidity ^0.4.25;

contract AppContract {
    DataContract dataContract;

    constructor(address _dataContract) {
        dataContract = _dataContract;
    }

    function setData(uint a, uint b) public {
        dataContract.setData(a,b);
    }

    function setData2(uint a, uint b) public returns (uint ab) {
        return dataContract.setData2(a,b);
    }

}

contract DataContract {
    uint stored_a = 0;
    uint stored_b = 0;

    function setData(uint a, uint b) external {
        stored_a = a;
        stored_b = b;
    }

    function setData2(uint a, uint b) external {
        stored_a = a;
        stored_b = b;
        return a*b;
    }

    function getData2() external pure {
        return stored_a*stored_b;
    }
}
