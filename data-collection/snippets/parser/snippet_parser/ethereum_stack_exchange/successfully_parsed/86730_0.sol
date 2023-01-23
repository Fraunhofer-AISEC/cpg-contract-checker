uint public constant MinimumInvestmen = 1e15;
uint public numInvestor = 0;
uint public depth = 0;
 uint investors_length = 3;
address payable [] public investors;
mapping (address => uint) public balances;

constructor ()  payable public{
    require(msg.value >= MinimumInvestmen, "less money");
    
    investors.push(msg.sender);
    numInvestor = 1;
    depth = 1;
    balances[address(this)] = msg.value;
    
    
}
function () payable external{
    require(msg.value >= MinimumInvestmen, "less money");
    balances[address(this)] += msg.value;
    numInvestor += 1;
    investors[numInvestor - 1] = msg.sender;
    
    if(numInvestor == investors_length){
        uint endIndex = numInvestor - 2**depth;
        uint startIndex = endIndex - 2**(depth-1);
        
        for(uint i = startIndex; i < endIndex; i++){
            balances[investors[i]] += MinimumInvestmen;
        }
        uint paid = MinimumInvestmen * 2**(depth-1);
        uint eachInvestment= (balances[address(this)] - paid) / numInvestor;
        for(uint i = 0; i < numInvestor; i++){
            balances[investors[i]] += eachInvestment;
        }
        balances[address(this)] = 0;
        depth += 1;
        investors_length += 2**depth;
        
    }
}

function withdraw() public{
    uint payout = balances[msg.sender];
    balances[msg.sender] = 0;
    msg.sender.transfer(payout);
}
