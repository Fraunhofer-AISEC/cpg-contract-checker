pragma solidity ^0.4.24;

contract TestSomething {

    uint256[] public barLengthToBarAmtForSale;

    constructor() public{
        uint16 counter = uint16(0);
        while(counter <= 10) {
            barLengthToBarAmtForSale.push(uint256(0));
            counter++;

        }
    }

    function getVal(uint val) public view returns(uint){
        return barLengthToBarAmtForSale[val]; 
    }

    function setVal(uint16 _length) public {
        barLengthToBarAmtForSale[_length]++;
    }

    function delVal(uint index) public {
        delete barLengthToBarAmtForSale[index];
    }

    function getLen() public view returns(uint){
        return barLengthToBarAmtForSale.length;
    }
}
