pragma solidity 0.5.0;

contract SimpleStorage {
    uint prize = 100;
    function() external payable {}

   function prizeDistribution() public payable {
        msg.sender.transfer(prize);        
    }
}
