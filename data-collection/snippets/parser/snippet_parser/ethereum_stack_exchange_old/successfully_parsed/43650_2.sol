contract Ownable {}
contract Crowdsale is Ownable {}
contract CappedCrowdsale is Crowdsale {}
contract RefundableCrowdsale is Crowdsale {}
contract MintedCrowdsale is Crowdsale {}
contract TieredCrowdsale is Crowdsale {}
contract FinalizedCrowdsale is RefundableCrowdsale {}
contract TimedCrowdsale is RefundableCrowdsale {}
