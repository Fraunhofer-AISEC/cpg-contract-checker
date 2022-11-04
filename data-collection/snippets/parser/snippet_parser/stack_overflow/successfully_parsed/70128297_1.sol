contract test {
    string[2] internal list1 = ["str1", "str2"];
    string[3] internal list2 = ["str3", "str4", "str5"];

    function entryPoint() public view returns (uint256) {
        return utilityFunction(list1, list2);
    }
    
    function utilityFunction(string[] storage _list1, string[] storage _list2) internal pure returns (uint256 result) {
        
    }
}
