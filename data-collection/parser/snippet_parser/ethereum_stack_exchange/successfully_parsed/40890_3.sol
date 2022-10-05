pragma solidity ^0.4.19;



contract Bank {

    

    address private owner;

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function Bank() public  {
        
        owner = msg.sender;
    }

    
    function getBalance() public view returns (uint balancr) {
        return this.balance; 
    }

    
    function deposit() public payable {
    }

    function withdraw(uint amount) public onlyOwner {
        
        
        require(this.balance >= amount);
        owner.transfer(amount);
    }

}
