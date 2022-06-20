event ExampleEvent(string indexed myString);

function eventTest() public {
    string memory strTest = "Hello, world!";
    emit ExampleEvent(strTest);
}
