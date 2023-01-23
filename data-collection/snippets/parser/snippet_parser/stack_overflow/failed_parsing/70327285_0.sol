
pragma solidity >=0.4.22 <0.9.0;
import "./Owned.sol";
import "./Logger.sol";


contract Faucet is OwnedMod, Logger {
    uint public numOfFunders;
   
    mapping (uint => address) public lutFunders;
    mapping (address => bool) public funders;
    uint public x = 10;
    
    modifier limitWithdraw(uint withdrawAmount){
        require(withdrawAmount < 1000000000000000000, 
        "the amount cannot be more than 1 eth");
        _;
    }

    receive () external payable {}
    function addFunds() external payable onlyOwner {
        address funder = msg.sender;
        if(!funders[funder]){
            uint index = numOfFunders++; 
            funders[funder] = true;
            lutFunders [index] = msg.sender;            
        }       
    }


    function withdraw(uint withdrawAmount) external limitWithdraw(withdrawAmount) {
        
          be more than 1 eth");
        payable(msg.sender).transfer(withdrawAmount);
            
    }

    function test1() public view returns(address) {
        return msg.sender;
    }

    function test2() public onlyOwner {
        
    }

    function getFunderAtIndex(uint8 index) external view returns (address){
        return lutFunders[index];
    }

    function transferOwnership(address newOwner) external onlyOwner {
        owner = newOwner;
    }

    function emitLog() public override pure returns(bytes32){
        return "Hello World";
    }

    function test4() public view returns(uint) {
        return x;
    }
    
    
}
