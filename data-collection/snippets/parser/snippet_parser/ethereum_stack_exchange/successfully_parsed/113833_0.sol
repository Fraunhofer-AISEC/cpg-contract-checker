    
pragma solidity 0.7.0;

contract RED {
   
     event fallback_event(address, uint);
     event Received(address, uint);
     
       fallback() external payable {
      emit fallback_event(msg.sender,msg.value);
      }
       uint fee;
       uint256 dynamicFee;
        address payable public feeCollector=payable(0xa23279459644347050015e05558905DA5059551E);
       address public owner;
        bool public locked;
        uint public x = 100;
        modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        
        
        
        _;
    }
   
       
    
    
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }
         constructor() {
         owner = msg.sender;
       
    }
       function getFeeCollector()public view returns (address payable){
       return feeCollector;
   }
     
     receive() external payable {
     require(msg.value >= 0.01 ether ,'bet amount is less than minBet i.e. 0.01 ETH');
     require(msg.value <= 10 ether,'bet amount is more than maxBet i.e. 10 ETH');
   
     
     emit Received(msg.sender, msg.value);
     
    }
   
       function withdrawMoney() public {
        address payable to = payable(msg.sender);
        to.transfer(address(this).balance);
    }
   
       function getBalance() public view returns(uint) {
        return address(this).balance;
    }
   
    event test(uint);
    function sendFeeToCollector() public returns(uint){
        emit test(x);
        x = x + 203 ;
        return x;
    
    
       
    }
   
    function sendWinningAmount(address payable add, uint256 amount)public   returns(bool){
       
        (bool sent, bytes memory data) = add.call{value: amount}("");
        require(sent, "Failed to send Ether");
        return sent;
    }
   
 
}
