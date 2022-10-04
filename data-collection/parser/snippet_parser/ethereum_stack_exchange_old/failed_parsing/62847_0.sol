struct OriginInfo{
    string 1;
    uint32 2; 
    uint8 3;
    address 4;
    bool 5;
}

function insertOrigin(string _1, uint32 _2, uint8 _3, address _4) external pure {
    OriginInfo(_1, _2, _3, _4, true);
}
