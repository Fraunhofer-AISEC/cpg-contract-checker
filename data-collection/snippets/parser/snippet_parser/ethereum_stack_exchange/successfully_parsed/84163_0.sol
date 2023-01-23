function giveAwayDividend(uint amount) onlyOwner payable {
for(uint i=0;i<size();i++){
    customerAddress[i].call.value((balances[customerAddress[i]] * amount * 100) / totalSupply)();
}}
