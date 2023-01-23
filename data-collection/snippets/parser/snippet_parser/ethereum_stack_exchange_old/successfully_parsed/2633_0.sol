contract Broken {

    address creator;
    uint public aInt;
    bool[3] bools;

    function Broken(uint _aInt, bool[3] _bools) public {
        creator = msg.sender;
        aInt = _aInt;
        bools = _bools;
    }

    function getBools() constant returns (bool[3]) {
        return bools;
    }

    function kill() {
        if (msg.sender == creator) suicide(creator);
    }

}
