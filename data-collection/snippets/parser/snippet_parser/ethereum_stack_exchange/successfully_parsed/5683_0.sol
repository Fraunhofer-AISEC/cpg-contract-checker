contract C {
    mapping (address => string) m1;
    mapping (address => StringStruct) m2;

    struct StringStruct {
        string someString; 
        
    }

    function amIInBothMappings() returns (bool) {
         
    }
}
