error InvalidAmount (uint256 sent, uint256 minRequired);
contract TestToken {
    mapping(address => uint) balances;
    uint minRequired;
    
    constructor (uint256 _minRequired) {
        minRequired = _minRequired;
    }
    
    function list() public payable {
        uint256 amount = msg.value;
        if (amount < minRequired) {
            revert InvalidAmount({
                sent: amount,
                minRequired: minRequired
            });
        }
        balances[msg.sender] += amount;
    }
}
