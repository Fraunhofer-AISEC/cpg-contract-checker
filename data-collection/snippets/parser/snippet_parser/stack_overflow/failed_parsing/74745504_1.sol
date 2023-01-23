contract BetContract {
    address owner;
    string title;
    
    
    receive()external payable{
        
    }
    
    function GetTitle(string memory title) public view returns(string){
        return this.title;
    }
}

contract Main {
   .
   .

   function GetBetTitle(address betAddress) public view returns(string){
       BetContract currentBet = BetContract(betAddress);

TypeError: Explicit type conversion not allowed from non-payable "address" to "contract BetContract", which has a payable fallback function.

       return currentBet.GetTitle();
   }}
