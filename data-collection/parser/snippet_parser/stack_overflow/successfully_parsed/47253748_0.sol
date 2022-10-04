pragma solidity ^0.4.11;
contract test {

struct Selling {
    address addr;
    string name;
    uint price;
}

mapping(string => Selling) selling;

function sellName() constant returns (bool ok)
{
    address a = 0x4c3032756d5884D4cAeb2F1eba52cDb79235C2CA;
    Selling storage myStruct = Selling(a,"hey",12);
}
}
