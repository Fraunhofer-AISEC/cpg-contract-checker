pragma solidity 0.4.25;

contract A{

    struct N{
        string any;
        uint[] numberArray;
    }

    N[] public numbers;

    function init(uint[] _numbers) public{
        numbers.push(N("anything", _numbers));
    }

    function getNumbersAtIndex(uint index) public view returns(uint[] _numbers) {
        return numbers[index].numberArray;
    }

}
