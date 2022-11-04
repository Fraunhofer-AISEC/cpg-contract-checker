function withdraw (uint wdraw_amt) public view returns(string memory error){
    if(wdraw_amt<=balance){
     balance -= wdraw_amt;    
    }
}