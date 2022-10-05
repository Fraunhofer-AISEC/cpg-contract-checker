contract Management {
    address payable immutable public manager;

    string public matchDispute;
    
    Generator generator;

    constructor(address _contract) {
        generator = Generator(_contract);
        manager = payable(generator.owner());
        matchDispute = generator.matchGenerated();
    }
}