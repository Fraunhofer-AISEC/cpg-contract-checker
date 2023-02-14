
pragma solidity ^0.6.0;

contract P{
    uint no1;
    uint no2;
    uint result;

    function MultEvensAddOdds(uint _no1, uint _no2) public view returns(uint) {
        uint myresult = result;
        if(_no1 % 2 == 0 && _no2 % 2 == 0){
            myresult = _no1 + _no2;
        }else if(_no1 % 2 == 1 && _no2 % 2 == 1){
            myresult = _no1 * _no2;
        }else{
            myresult = _no1 / _no2;
        }
        return myresult;
    }
}
