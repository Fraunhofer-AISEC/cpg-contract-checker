contract Greetings {
    string message;

    function Greetings() {
        message = "I am ready!";
    }

    function setGreetings(string _message) public {
        message = _message;
    }

    function getGreetings() constant returns (string) {
        return message;
    }
}
