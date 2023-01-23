pragma solidity >=0.5.0 <0.7.0;

contract TronStack {
    
    uint public investmentCount;
    mapping (uint => Investment) public investments;

    struct Investment {
        uint id;
        uint amount;
    }

    event InvestmentCreated (
        uint id,
        uint amount
    );

    constructor() public {
    }

    function invest(uint _amount) public {
        investmentCount++;
        investments[investmentCount] = Investment(investmentCount, _amount);
        emit InvestmentCreated(investmentCount, _amount);
    }

}
