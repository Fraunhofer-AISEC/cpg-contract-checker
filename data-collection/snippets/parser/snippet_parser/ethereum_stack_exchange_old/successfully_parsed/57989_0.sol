pragma solidity ^0.4.17;

contract mypool{
    address public manager;
    string poolname;
    uint256 poolEndDate;
    uint256 poolAmount;

    constructor () public {
        manager = msg.sender;
    }

    mapping (address => uint256) public balanceOf;

    
    struct Payer {
        string name;
        address player;
        uint256 amount;
    }

    Payer[] public players;
    
    function enterPoolInfo(string name,uint256 endDate, uint256 amount) public {
        poolname = name;
        poolEndDate = endDate;
        poolAmount = amount;
    }
    
    function enter(string name,uint256 amount) public payable {

        Payer memory m;
        
        m.player = msg.sender;
        m.amount = amount;
        m.name = name;
        players.push(m);
    }

    function getBalance() public view returns (uint) {
        return this.balance;
    }



     function transferd(address _to) payable {
        
        
        
        

        uint256 balance = this.balance;
        _to.transfer(balance);                        
    }
}
