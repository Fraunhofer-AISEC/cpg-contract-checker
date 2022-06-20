contract Numbers {
    uint256[] private _numbers;

    modifier bigNumber(uint256 someNumber) {
        require(someNumber > 10, "Numbers: Number must be greater than 10");
        _;
    }

    function _addNumber(uint256 someNumber) private bigNumber(someNumber) {
        _numbers.push(someNumber);
    }

    function addNumbers(uint256[] memory _newNumbers) external {
        for (uint256 i = 0; i < _newNumbers.length; i++) {
            _addNumber(_newNumbers[i]);
        }
    }
}
