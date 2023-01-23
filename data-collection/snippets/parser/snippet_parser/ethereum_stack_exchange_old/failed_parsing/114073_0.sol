

pragma solidity >=0.7.0 <0.9.0;


contract FourthContract {

    uint[] public numbers = [10,20,30,40,50,60,70,80,90,100];

    function countOddNumbers() public view returns (uint) {
        uint count = 0;

        for(uint i = 0; i < numbers.length; i++) {
            ***if (isOddNumber(numbers[i])) {
                count = count + numbers[i];
            }***
        }
        return count;
    }

    function isOddNumber (uint _number) public view returns(bool) {
        if (_number % 2 == 1) { 
           return true;
        }
        else {
           return false;
        }
    }
}
