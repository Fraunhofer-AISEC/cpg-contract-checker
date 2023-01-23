function test() public view returns (string memory, string memory)
{
    string memory a = "Hello?";
    string memory b = string(copyBytes(bytes(a)));
    bytes(a)[5] = '!'; 
    return (a, b);
}
