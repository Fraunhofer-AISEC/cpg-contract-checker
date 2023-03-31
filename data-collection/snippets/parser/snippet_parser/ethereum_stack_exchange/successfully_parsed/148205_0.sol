uint[] public numbers;

function getNumbers() public view returns (uint[] memory) {
    return numbers;
}

function findNumbers(uint abc) public {
    delete numbers;
    for (uint i = 0; i < 5; i++) {
        numbers.push(abc + i);
    }
}

function findNumbers2(uint abc) public returns (uint[] memory) {
    delete numbers;
    for (uint i = 0; i < 5; i++) {
        numbers.push(abc + i);
    }
    return numbers;
}
