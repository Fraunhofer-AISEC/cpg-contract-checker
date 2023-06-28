function example(uint256[] calldata _numbers) external {
    uint256[] memory _evenNumbers = new uint256[](_numbers.length);

    
    uint256 _evenCounter;
    for (uint256 i; i < _numbers.length; ++i) {
        if (_numbers[i] % 2 == 0) {
            _evenNumbers[_evenCounter] = _numbers[i];
            ++_evenCounter;
        }
    }

    someOtherFunction(_evenNumbers);
}
