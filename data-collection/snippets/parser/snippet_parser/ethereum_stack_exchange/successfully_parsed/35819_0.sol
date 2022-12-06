contract CompoundInterest {

uint public Periods = 30;
uint public Principle = 10000;
uint public Interest;
uint public InterestRateInteger = 2;

 function CalculatedInterest() public {

 Interest = Principle * (1 + InterestRateInteger/100)**Periods;

 }
}