library foo {
    
    function greet(string storage self) returns (string) {
        return "Hello";
    }
}

contract Greeter {

    using foo for string;
    string name = "lary";

    function say() constant returns (string) {
        return name.greet();
    }
}
