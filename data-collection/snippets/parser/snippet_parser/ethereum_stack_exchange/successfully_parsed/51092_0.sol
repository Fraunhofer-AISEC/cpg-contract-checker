contract One {
    Two two;
    function makeCall() {
         two.someExternalFunction();
    }
}

contract Two {
    function someExternalFunction() external {
       
    }
}
