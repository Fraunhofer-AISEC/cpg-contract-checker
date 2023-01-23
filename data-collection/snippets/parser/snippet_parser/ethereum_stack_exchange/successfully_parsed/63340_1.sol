pragma solidity 0.5.0;

contract TwoD {

    uint[][] public test;

    function appendFirstOrderArray() public {
        uint[] memory element;
        test.push(element);
    }

    function appendSecondOrderElementAtRow(uint row, uint value) public {
        test[row].push(value);
    }

    function getFirstOrderLength() public view returns(uint) {
        return test.length;
    }

    function getSecondOrderLengthAtRow(uint row) public view returns(uint) {
        return test[row].length;
    }

}
