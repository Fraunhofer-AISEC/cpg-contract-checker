
function _addNumber(uint256 someNumber) external bigNumber(someNumber) {
    _numbers.push(someNumber);
}

function addNumbers(uint256[] memory _newNumbers) external {
    for (uint256 i = 0; i < _newNumbers.length; i++) {
        try this._addNumber(_newNumbers[i]) {
            
        } catch (bytes memory) {
            
        }
    }
}
