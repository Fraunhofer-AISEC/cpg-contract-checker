contract MoonShardToken is StandardToken, Ownable {
    string public name = "MyContract";
    uint8 public decimals = 18;
    string public symbol = "My";
    
    constructor() public {
        totalSupply_ = (36000000 * (10 ** 18));
        balances[msg.sender] = totalSupply_;
    } 
}
