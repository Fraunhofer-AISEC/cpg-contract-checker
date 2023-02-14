function parseError (bytes memory val) private pure returns (string memory)
{
    require(val.length>68, Strings.toString(val.length));
    return string(BytesLib.slice(val, 68,val.length-68));
}
