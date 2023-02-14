contract BetContract {
    address owner;
    string title;
    
    
    function GetTitle(string memory title) public view returns(string){
        return this.title;
    }
}

contract Main {
    .
    .
    
    function GetBetTitle(address betAddress) public view returns(string){
        BetContract currentBet = BetContract(betAddress);
        return currentBet.GetTitle();
    }
}
