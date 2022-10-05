contract Test {
    address owner;

    function Test(){
        owner = msg.sender;
    }

    function getOwner() returns (address owner) {
        return owner;
    }
}
