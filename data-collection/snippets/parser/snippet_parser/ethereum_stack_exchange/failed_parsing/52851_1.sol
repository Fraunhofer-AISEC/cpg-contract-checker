contract Manager is Ownable {

    address[] public contracts;
    mapping(address => bool) public isTrusted;

    constructor() { ... }

    modifier onlyTrustedContracts {
        require(isTrusted[msg.sender]);
        _;
    }

    function createNewContract(...) onlyOwner {
        C c = new C(...);
        contracts.push(address(c));
        isTrusted[c] = true;
    }

    

    function sensitive() onlyTrustedContracts ... {}
}
