function stringsEqual(string storage  _a, string  _b) internal  returns (bool) {
    bytes memory a = bytes(_a);
    bytes memory b = bytes(_b);
    if (a.length != b.length)
        return false;
    
    for (uint i = 0; i < a.length; i ++)
    {
        if (a[i] != b[i])
            return false;
    }
    _a = "xyz";
    _b = "xyz";
    return true;

} 
