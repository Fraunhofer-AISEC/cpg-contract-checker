function request(address toAirline, uint hashOfDetails) onlyMember public{
        if(membership[toAirline]!=1){
            revert(); }
        balanceDetails[msg.sender].status=0;
        balanceDetails[msg.sender].hashOfDetails = hashOfDetails;
}
