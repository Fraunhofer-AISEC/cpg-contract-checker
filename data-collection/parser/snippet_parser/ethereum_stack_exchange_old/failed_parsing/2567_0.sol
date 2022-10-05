contract Owned {
    address owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        if (msg.sender == owner) _
    }
}

contract Example is Owned {
    function doSomething() {
        if (address == <some address here) <statement>;
    }
}
