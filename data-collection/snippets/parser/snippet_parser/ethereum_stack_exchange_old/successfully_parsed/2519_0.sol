function convertingToString()public returns(string){
bytes32 memory hw = "Hello World";
string memory converted = string(hw);
return converted;
}
