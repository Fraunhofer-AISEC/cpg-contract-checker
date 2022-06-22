function multiValueFunction() public returns (bool, string memory, uint[] memory, uint {

return (true, "New String", [1,2], 21)
}

function differentFunction() public {
uint numberToKeep;
(,,,numberToKeep) = multiValueFunction();
}
