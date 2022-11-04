
pragma solidity 0.8.7;

contract Gas_Test{
    uint[] public arrayFunds;
    uint public totalFunds;

    constructor() {
        arrayFunds = [1,2,3,4,5,6,7,8,9,10,11,12,13,2,3,4,5,6,7,8,9,10,11,12,13];
    }

    function optionB2() external {
        uint _totalFunds;
        uint al = arrayFunds.length;
        for (uint i =0; i < al; i++){
            _totalFunds = _totalFunds + arrayFunds[i];
        }
        totalFunds = _totalFunds;
    }

    function optionC() external {
        uint _totalFunds;
        uint[] memory _arrayFunds = arrayFunds;
        for (uint i =0; i < _arrayFunds.length; i++){
            _totalFunds = _totalFunds + _arrayFunds[i];
        }
        totalFunds = _totalFunds;
    }

}
