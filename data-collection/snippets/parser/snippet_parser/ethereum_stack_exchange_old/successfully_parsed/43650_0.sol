contract Ownable {
    address public owner = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c; 

    function getOwner() public view returns(address theOwner) {
        return owner;
    }
}

contract SampleCrowdsale is Ownable {

    address public owner = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c; 

    

    function getOwner2() public view returns(address theOwner) {
        return super.getOwner();
    }
}

contract CappedCrowdsale is SampleCrowdsale {

    address public owner = 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db;

    

    function getOwner3() public view returns(address anotherOwner) {
        return super.getOwner2(); 
    }

    

    function telling() public view returns(address chained) {
        return super.getOwner();
    }
}
contract RefundableCrowdsale is SampleCrowdsale {}
contract MintedCrowdsale is SampleCrowdsale {}
contract TieredCrowdsale is SampleCrowdsale {}

contract FinalizedCrowdsale is RefundableCrowdsale {}
contract TimedCrowdsale is FinalizedCrowdsale {}
