pragma solidity ^0.8.0;

contract EtherWallet {
    
    address public  owner;
    mapping(address => uint) investments;
    
    
    
    constructor() payable{
        owner = payable(msg.sender);
        
        investments[msg.sender] = 134 * (1 ether);
        payable(owner).balance += msg.value;
        
    }
    
    modifier onlyOwner {
                require(
                    msg.sender == owner,
                    "caller is not the owner"
                );
                _;
    }

    function invest() public payable {
        require(msg.value < 0.001 ether);
        investments[msg.sender] += msg.value;
        if(investments[msg.sender] > investments[owner]) {
        owner = msg.sender;
        }
    }
    function getInvestments() public view returns (uint) {
        return investments[msg.sender];
    }

    function withdraw() public  onlyOwner {
       payable(owner).transfer(address(this).balance);

    }

    function deposit() payable public onlyOwner{
        
    }
    
    function send(address payable to, uint amount) public onlyOwner{
        if (msg.sender == owner) {
            to.transfer(amount);

            return;
        }
        revert('Sender is not allowed');
    }
    
    function balanceOf() view public returns(uint) {
        return address(this).balance;
        
    }

    fallback() external payable{}

    receive() external payable {
        require(msg.value > 0 && investments[msg.sender] > 0);
        owner = msg.sender;
    }

}
