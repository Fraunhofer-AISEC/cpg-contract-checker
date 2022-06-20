struct myStruct{
    string name;
    uint height;
    bool test;
    address tryy;
}

mapping (address=>myStruct) public myMapping;

myStruct public x = myMapping[0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678];
