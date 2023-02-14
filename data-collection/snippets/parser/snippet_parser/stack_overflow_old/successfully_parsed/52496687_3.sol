contract MarketPlace is Escrow {
    Escrow escrow;
    constructor(address _escrowContractAddress) public payable {
        owner = msg.sender;

        
        escrow = Escrow(_escrowContractAddress);
    }
}
