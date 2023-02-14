contract Base1 {
    
    uint256[1000] private __gap;
}

contract Base2 {
    
    uint256[1000] private __gap;
}

contract Child is Base1, Base2 {
    uint256 testVariable = 123;
}
