contract B {
    address _addressFactory = addressCopiedFromMumbaiTestnet;
    uint256 datecreation;
    ....

    modifier onlyFactory() {
        require(msg.sender == _addressFactory, "Not permitted - not Factory");
        _;
    }

    constructor (address owner) onlyFactory{
        _owner = owner;
        datecreation = block.timestamp;
    }
    ....
}
