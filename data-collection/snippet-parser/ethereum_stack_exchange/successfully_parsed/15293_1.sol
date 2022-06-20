contract OwnedIndex {

    mapping (bytes32 => string) ownedString;

    function set(string _str)
    {
        
        ownedString[sha3(msg.sender, _str)] = str;
    }

    function clear(string _str)
    {
        
        delete ownedString[sha3(msg.sender, _str)];
    }
}
