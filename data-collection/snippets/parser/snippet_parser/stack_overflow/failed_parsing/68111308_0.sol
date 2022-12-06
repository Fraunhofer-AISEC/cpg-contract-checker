    contract Base {
    uint256 Age;
    function getAge(uint256 Age) public{ 
        x = Age;
        return x;
    }
    function sumAge(uint256 y) internal pure (uint256){
        uint256 newAge = x + y;
        return newAge;
    }
}
