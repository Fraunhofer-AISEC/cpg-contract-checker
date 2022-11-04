string public s1 = "string(";
string public s2 = ")";
bytes public yourBytes = '0x100';
string public combined;

function combine() public {
    combined = string.concat(s1, string(extractedStr), s2);
}
