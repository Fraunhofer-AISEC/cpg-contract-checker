contract Donation {
     mapping(address=>uint) donation;
  
     **function donate(uint _donateAmount) public payable {
        donation[msg.sender] += _donateAmount;**

     *
      
      
      
      
    }

  

}
