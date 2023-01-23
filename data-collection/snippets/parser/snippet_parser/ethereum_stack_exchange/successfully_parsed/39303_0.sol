pragma solidity^0.4.11;

contract GasRefundTest {

    uint[] myArray = [1, 2];

    function deleteLastElem() public returns(bytes32) {
        myArray.length--;
    }
}
