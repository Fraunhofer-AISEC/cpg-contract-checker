function myFunction(uint256 input) public view returns (uint256) {
    require(input >= 5, "myFunction only accepts arguments which are greather than or equal to 5");
    return input * input - 25;
}
