contract Supreme {
    address public big;
    uint256 public cost;

    function Supreme() 
      public
    {
        big = msg.sender;
        cost = 3 ether;
    }

    function Road() 
      external
      payable
    {
        require(msg.value >= cost);
        big.transfer(msg.value);
        big = msg.sender;

        cost += 1 ether;
    }
}
