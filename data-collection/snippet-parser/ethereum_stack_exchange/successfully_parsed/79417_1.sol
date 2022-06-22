contract Child is Ownable {

    function changeOwner() public {
        owner = msg.sender;
    }
}
