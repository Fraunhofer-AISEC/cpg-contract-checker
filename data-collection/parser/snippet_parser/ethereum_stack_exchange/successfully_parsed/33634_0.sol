contract MyContact {

    mapping(address => uint) private balances;

    modifier positiveNumber(uint number) {
        require(number > 0);
        _;
    }

    function deposit(uint amount)
      external
      positiveNumber(amount)
    {
      balances[msg.sender] += amount;
    }

    function hasFunds(address depositor, uint amount)
        external
        view
        positiveNumber(amount)
        returns (bool)
    {
        return balances[depositor] >= amount;
    }
}
