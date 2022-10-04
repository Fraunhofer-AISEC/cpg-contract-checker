function getThing()
    public
    returns (bytes32[] memory)
{
    bytes32[] memory addrs = new address[](indexes.length);        
    for (uint i = 0; i < StructArray.length; i++) {
        Struct storage structs = StructArray[array[i]];
        thing[i] = structs.thing;    
    }
    return (thing);
}
