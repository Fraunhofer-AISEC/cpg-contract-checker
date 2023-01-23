contract MyRandom {

    event RequestRandom(uint seed);

    address public myServerWallet;
    uint public myRandomNumber;

    constructor(address a) {
       myServerWallet = a;
    }

    function makeRandomRequest(uint seed) external {
        emit RequestRandom(seed);
    }

    function setRandomResult(uint result) external {
        require(msg.sender == myServerWallet, "Only server may call");
        myRandomNumber = result;
    }
}
