contract GuessTheRandomNumberChallenge {
    uint8 answer;

    function GuessTheRandomNumberChallenge() public payable {
        require(msg.value == 1 ether);
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);

        
    }
}

GuessTheRandomNumberChallenge public handle;

constructor() public payable {
    handle = GuessTheRandomNumberChallenge(0x123123mycontractaddress);
}

function check() public {
    handle.guess.value(1 ether)(83); 
}
