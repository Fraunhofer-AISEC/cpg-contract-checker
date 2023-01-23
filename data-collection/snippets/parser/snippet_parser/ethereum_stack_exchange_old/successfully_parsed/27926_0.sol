contract Sample {

    event ExampleEvent(string data_description);

    function getData() public constant returns (string) {
        ExampleEvent("From Sample contract");
        return "Event sent";
    }
}
