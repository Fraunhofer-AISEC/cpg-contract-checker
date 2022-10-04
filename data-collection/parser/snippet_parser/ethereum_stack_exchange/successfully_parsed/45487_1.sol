function splitString(string _s, string _seperator) public returns(string, string)
{
var s_slice = _s.toSlice();
var seperator_slice = _seperator.toSlice();
string memory result = "";
var result_slice = result.toSlice();
result_slice = s_slice.split(seperator_slice);
return (result_slice.toString(), s_slice.toString());
}
