contract Gas {

    
    struct IdStruct { 
        uint128 id;                 
        uint32  value;             
        uint32  field2;
        uint64  padding;
    }


    uint128 [] itemIds;
    mapping (uint128 => IdStruct) items
}