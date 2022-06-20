pragma solidity 0.4.25;

contract A{
    struct N{
        string any;
        uint256[] numberArray;
    }

    N[] public numbers;

    function init(uint256[] _numbers) public{
        for (uint256 i = 0; i < _numbers.length; i++) {
            uint256[] memory arr;
            arr[0] = _numbers[i];
            numbers.push(N("anything", arr));
        }
    }
}
