
for (uint i = 0; i < 5000; i++) {

    
    
    uint256 randomIndex = getRandomNum().mod(_randomNumbers.length);

    
    uint256 resultNumber = _randomNumbers[randomIndex];

    
    
    _randomNumbers[randomIndex] = _randomNumbers[_randomNumbers.length - 1];

    
    _randomNumbers.pop();

    
    

}
