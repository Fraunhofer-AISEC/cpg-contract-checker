contract TokenGeneration is owned{
     
     mapping(address => uint) public tokenBalance;
     
     uint public tokenPrice = 1 ether;  

     constructor (){
        tokenBalance[msg.sender] = 100;
     }


     function createToken() public own {
        
         tokenBalance[owner]++;
     }

     function burnToken() public own {
          
          tokenBalance[owner]--;
     }

     function buyToken() public payable {

         
         
         uint countOfEthersToBuy = msg.value / tokenPrice; 

        
         require(countOfEthersToBuy > 0, "Not enough ethers was sent");

        
        
         uint remainingWei = msg.value % tokenPrice;

         require(remainingWei == 0, "Not whole ethers was sent");

         require(tokenBalance[owner] > countOfEthersToBuy,"NOT ENOUGH TOKEN");
         tokenBalance[owner] -= countOfEthersToBuy;
         tokenBalance[msg.sender] += countOfEthersToBuy;

     }

     function sendToken(address _to, uint amount) public {
         require(tokenBalance[msg.sender] >= amount , "NOT ENOUGH BALANCE");

        tokenBalance[msg.sender] -= amount; 
        tokenBalance[_to] += amount;
     }
}
