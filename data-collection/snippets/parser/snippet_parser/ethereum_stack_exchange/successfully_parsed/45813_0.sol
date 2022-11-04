function compareStringsbyBytes(string s1, string s2) public pure returns(bool)
{
bytes memory s1bytes = bytes(s1);
bytes memory s2bytes = bytes(s2);
if(s1bytes.length!=s2bytes.length) {
    return false;
}
else{
    for(uint i = 0;i<s1bytes.length;i++)
    {
        if(s1bytes[i] != s2bytes[i])
         return false;
    }
    return true;
}
}
