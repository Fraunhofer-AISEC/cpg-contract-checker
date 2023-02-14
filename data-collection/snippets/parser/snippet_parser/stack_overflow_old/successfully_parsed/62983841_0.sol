    contract MyContract {
    address payable public personA;
    address payable public personB;
    mapping(address => uint) balances;
    modifier onlyonlypersonA() {
        require(msg.sender == onlypersonA, "Only onlypersonA can call this method");
        _;}       
   function Send() onlypersonA external payable {
        if(msg.value < 2 ether) {revert();} 
        balances[msg.sender] += msg.value;}
}

