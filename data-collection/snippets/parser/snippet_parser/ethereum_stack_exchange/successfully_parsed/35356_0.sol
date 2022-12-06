contract MyContract {
    address public owner;

    function MyContract() public {
        owner = msg.sender;
    }

    function ownerOnly() public view returns(uint) {
        if(owner != msg.sender) throw;

        
    }
}
