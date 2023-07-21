Person[] private _people;
function getPerson(uint256 index) public view returns (Person memory) {
    return _people[index];
}
