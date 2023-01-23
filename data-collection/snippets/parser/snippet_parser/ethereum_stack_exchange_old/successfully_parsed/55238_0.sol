contract getSome {

    finalizeToken token;


    constructor() {
        token = finalizeToken(0xdc0974e65e479fa587118eb7588f426229a39d31);
    }

    function testWrite() public returns (bool) {
        setval();
    }

    function setval()  {
        token.setEpoch(8000);
    }

}

interface fToken {
    function setEpoch(uint _blocks) external ;
}

contract finalizeToken is fToken {
    uint public epochCount;


    constructor() {}

    function setEpoch(uint _blocks) public {
        epochCount = _blocks;
    }


}
