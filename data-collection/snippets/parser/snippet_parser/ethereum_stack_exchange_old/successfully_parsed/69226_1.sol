contract AccessControl {
    mapping (address => bool) authorized;

    function getSomething () public view returns (string) { 
        require(authorized[msg.sender]);
        return "hello";
    }
}
