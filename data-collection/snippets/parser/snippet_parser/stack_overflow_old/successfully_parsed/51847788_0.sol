function getLink() public view returns(string){
    if(tokenBalances[msg.sender]>0){
        return link;
    }else{
        return "You need to purchase a token at first...";
    }
}
