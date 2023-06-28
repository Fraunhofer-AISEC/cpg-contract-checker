contract DAO_Test{

   function buyToken() payable external returns(bool){        
    uint amount = (precision*msg.value)/exchange_Rate;
    token_balances[msg.sender] += amount/1000000000000000000;             
    ether_balances[msg.sender] += msg.value/1000000000000000000;
    Deposit(msg.sender, msg.value);
    return true;
    }

   function send_funding (bytes2 proposal_id) internal  returns (bool){
    uint indx = find_proposal_indx (proposal_id);
    Proposal temp;
    temp = proposals[indx];
    if (final_result[indx]){ 
    temp.recipient.transfer(temp.target_val*1000000000000000000);       
}
}
}