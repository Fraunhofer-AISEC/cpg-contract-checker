function addNumbers(uint256[] memory _newNumbers) external {
    for (uint256 i = 0; i < _newNumbers.length; i++) {

        
        if (_newNumbers[i] <= 10) {
            _addNumber(_newNumbers[i]);
        }
    }
}
