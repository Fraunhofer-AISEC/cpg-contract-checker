uint256 public revenue;
uint256 public distributionAmount; 


function calculate(uint256 _revenue, uint256 _totalSupply, uint256 holdersBalance) public {
    revenue = _revenue;
    uint256 amount = (revenue * 40)/100;
    amount = ((amount / _totalSupply) * holdersBalance);
    distributionAmount = amount;  
}
