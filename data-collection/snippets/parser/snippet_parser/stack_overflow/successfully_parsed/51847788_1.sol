function getLink(address account) public view returns(string){
    if(tokenBalances[account] > 0){
        return link;
    }else{
        return "You need to purchase a token at first...";
    }
}
