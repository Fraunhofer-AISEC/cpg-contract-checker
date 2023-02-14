pragma solidity ^0.4.24;

contract extractDigits{
    uint8[] digits;

    function generateDigits() public returns(uint){
        delete digits;
        uint number = uint(keccak256(abi.encodePacked(now)));
        uint returnNum = number;
        while (number > 0) {
            uint8 digit = uint8(number % 10);
            number = number / 10;
            digits.push(digit);
        }

        return returnNum;
    }

    function getDigit(uint x) public view returns (uint8) {
        return digits[x];
    }
}
