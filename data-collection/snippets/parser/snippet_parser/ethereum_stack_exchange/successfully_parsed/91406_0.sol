function test() public view returns (string memory, string memory)
{
    string memory a = "Hello?";
    string memory b = a;
    bytes(a)[5] = '!'; 
    return (a, b);
}
