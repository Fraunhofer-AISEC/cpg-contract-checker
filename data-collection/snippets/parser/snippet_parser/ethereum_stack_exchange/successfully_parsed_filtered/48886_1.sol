 uint256 bal;

 function InReturn(uint256 a,uint256 b,uint256 c) public payable { 

   

   
    bal = (a*c*100000000000000)/b;

    iwallet.transfer(bal);


}
