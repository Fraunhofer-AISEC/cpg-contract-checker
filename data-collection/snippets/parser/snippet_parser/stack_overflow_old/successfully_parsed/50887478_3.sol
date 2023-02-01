contract Ledger{

    address internal manager;
    mapping(address => uint) public balances;
    address[] public accounts;
    uint public totalBalance;

    constructor() public{
        manager = msg.sender;
    }

    function credit() payable public{
        if(balances[msg.sender] == 0){
            accounts.push(msg.sender);
        }

        balances[msg.sender] += msg.value;
        totalBalance += msg.value;
    }

    function debit(uint amount) public{
        
        require(balances[msg.sender] > amount);

        
        msg.sender.transfer(amount);
        balances[msg.sender] -= amount;
        totalBalance -= amount;
    }

    function distributeProfit(uint amountToDistribute) public {
        require(manager == msg.sender);
        require(amountToDistribute > 0);

        
        uint profit = amountToDistribute / accounts.length;

        for(uint index=0; index<accounts.length; index++){
            balances[accounts[index]] += profit;
        }
    }

 }
