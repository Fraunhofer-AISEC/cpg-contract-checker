contract testcontract {
    string mystringStorage = "Blah";

    function testme () returns (string){
        
        string memory mystring = "foo2";

        
        string mystringMemory = mystringStorage;

        return "foo";
    }
}
