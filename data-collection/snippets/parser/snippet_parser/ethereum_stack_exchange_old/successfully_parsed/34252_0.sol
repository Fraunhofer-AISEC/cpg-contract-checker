 function myFunc(string name) public returns(bool,bytes32)
{
    bytes32 hash= sha256(name);
    names[hash] = true; 
    return (true,hash);
}
