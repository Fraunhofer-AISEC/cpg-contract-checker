pragma solidity 0.5.0;

contract Div {

    function divider(uint numerator, uint denominator, uint precision) public pure returns(uint) {
        return (numerator*(uint(10)**uint(precision+1))/denominator + 5)/uint(10);
    }
}
