
string[] public cidsArray;


mapping(string => Content) public contentsMapping;


    function getTotalContentCount() public view returns (uint256) {
        return cidsArray.length;
    }

    

    
    function getCidArray() public view returns (string[] memory) {
        return cidsArray;
    }
