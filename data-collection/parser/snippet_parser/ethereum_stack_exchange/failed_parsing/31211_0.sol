contract EtherBay {
    event NewEvent(address addr, uint intValue, bytes32 name);

    function withdraw() returns (bool) {
enter preformatted text here
        NewEvent({ addr: 0, intValue: 10, name: 'someString'}); 
    }
 }
