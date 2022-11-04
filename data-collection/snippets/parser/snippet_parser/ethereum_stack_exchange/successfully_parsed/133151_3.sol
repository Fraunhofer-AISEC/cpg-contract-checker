 function buyToken() public payable {
     require((tokenBalance[owner] * tokenPrice)/msg.value > 0,"NOT ENOUGH TOKEN");

     uint amountInEth = msg.value/1 ether;

     tokenBalance[owner] -= amountInEth;

     tokenBalance[msg.sender] += amountInEth;
 }
