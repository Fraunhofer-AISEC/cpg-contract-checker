library StringUtils {
    function isEmptyString(string s) external pure returns (bool) {
        return (keccak256(s) == keccak256(''));
    }
}
