pragma solidity ^0.4.13;


contract Trace{

struct Tru{
    bool consumed;
    bool used;
    bool created;
    uint id;
    uint producedBy;
    uint consumedBy;
}

struct PrimitiveActivity{
    bool created;
    string storage name;
    uint id;
    uint inputTruId;
    uint outputTruId;
}
}
