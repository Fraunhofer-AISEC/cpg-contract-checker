contract Ownable {}
contract Crowdsale is Ownable {}
contract SampleCrowdsale is Crowdsale {}
contract CappedCrowdsale is SampleCrowdsale {}
contract RefundableCrowdsale is SampleCrowdsale {}
contract MintedCrowdsale is SampleCrowdsale {}
contract TieredCrowdsale is SampleCrowdsale {}
contract FinalizedCrowdsale is RefundableCrowdsale {}
contract TimedCrowdsale is FinalizedCrowdsale {}
