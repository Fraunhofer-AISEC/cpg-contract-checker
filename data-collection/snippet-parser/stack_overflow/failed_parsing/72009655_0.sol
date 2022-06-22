contract Test {
    uint age;
    string varAge = "age";

    function setAge() public {
        
       ${varAge} = 30;
    }
}
