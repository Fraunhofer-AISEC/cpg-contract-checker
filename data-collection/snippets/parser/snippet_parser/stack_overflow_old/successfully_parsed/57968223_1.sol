mapping(string => uint256) myMap;

function setValue(string memory name, uint256 value) internal {
    myMap[name] = value;
}
