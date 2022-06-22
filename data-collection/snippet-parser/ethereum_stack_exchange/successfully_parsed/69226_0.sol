contract AccessControl {
    mapping (address => bool) authorized;

    function getSomething () public view returns (string) { 
        
        return "hello";
    }
}
