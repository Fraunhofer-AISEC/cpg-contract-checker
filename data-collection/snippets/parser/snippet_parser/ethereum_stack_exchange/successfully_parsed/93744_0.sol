pragma solidity >=0.5.10 <0.7.0;

contract test {
    
    constructor() public payable {
        require(msg.value > 0, "Must bet a positive amount");
    }
    
    function viewBet() public view returns(uint) {
        return address(this).balance;
    }
    
    function matchBet() external payable {
        require(msg.value == address(this).balance, "Must match original bet");
    }
}
