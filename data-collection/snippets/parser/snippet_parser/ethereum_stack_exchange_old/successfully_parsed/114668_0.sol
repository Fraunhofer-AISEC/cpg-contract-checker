contract Published {

    struct Test {
        uint testData_1;
        uint testData_2;
    }
    
    
    mapping(address => mapping(uint256 => Test)) public tests;
}
