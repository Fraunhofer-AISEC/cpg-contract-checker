contract Token {
    string public greeting;
    mapping (address => uint) public balances;
    constructor() public {
            greeting = 'Hello';
            balances[msg.sender] = 33333;
    }
}
