string constant bellCurveTable = "\
A\
BB\
CCC\
DDDD\
EEEEE\
FFFFFF\
GGGGGGG\
HHHHHHHH\
IIIIIIIII\
JJJJJJJJJJ\
KKKKKKKKKK\
LLLLLLLLLL\
MMMMMMMMM\
NNNNNNNN\
OOOOOOO\
PPPPPP\
QQQQQ\
RRRR\
SSS\
TT\
U\
";

function lookupString(uint256 index) public pure returns (uint256) {
    bytes memory bellCurveTableBytes = bytes(bellCurveTable);
    return uint256(bellCurveTableBytes[index]) - 64;
}
