address COMPOUND_CETH_ADDRESS = 0x859e9d8a4edadfEDb5A2fF311243af80F85A91b8;
cETH ceth = cETH(COMPOUND_CETH_ADDRESS);

uint totalContractBalance = 0; 
mapping(address => uint) balances;
mapping(address => uint) depositTimestamps;


function getContractBalance() public view returns(uint){
    return totalContractBalance;
}

function addBalance() public payable{
    uint balanceBefore = ceth.balanceOf(address(this));
    ceth.mint{value:msg.value}();
    uint balanceAfter = ceth.balanceOf(address(this));

    balances[msg.sender] = balanceAfter - balanceBefore;
    totalContractBalance = totalContractBalance + msg.value;
    depositTimestamps[msg.sender] = block.timestamp;

}

function getBalance(address user) public view returns(uint){
    return balances[user] * ceth.exchangeRateStored() / 1e18 ;
}

function getExchangeRate() public view returns(uint){
    return ceth.exchangeRateStored() / 1e18 ;
}

function getCethBalance(address user) public view returns(uint){
    return balances[user] ;
}



















function withdraw() public payable {
    ceth.redeem((90*balances[msg.sender])/100);
    balances[msg.sender] = 0;
}

function addMoneyToContract() public payable {
    totalContractBalance += msg.value;
}
