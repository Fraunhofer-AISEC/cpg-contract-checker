contract E{
    address public sender;
    uint public x;

    function set(uint _x) {
        x = _x;
        sender = msg.sender;
    }

    function get() constant returns(uint) {
        sender = msg.sender;
        return x;
    }
}
