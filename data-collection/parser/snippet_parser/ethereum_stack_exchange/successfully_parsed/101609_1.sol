contract mappingOfArrayOfStructs{
    struct Donation {
        uint id;
        uint amount;
        string donor;
        string msg;
        uint timestamp; 
    }
    uint amount = 0;
    uint id = 0;
    mapping(address => uint) public balances;
    mapping(address => Donation[]) public donationsMap;

    function donate(address _recipient, string calldata _donor, string calldata _msg) public payable {
        require(msg.value > 0, "The donation needs to be >0 in order for it to go through");
        amount = msg.value;
        balances[_recipient] += amount;        
       donationsMap[_recipient].push(Donation(id++,amount,_donor,_msg,block.timestamp));
  }
  
   function donations_getter(address _recipient, uint _id) public view returns (Donation[] memory){
        return donationsMap[_recipient];
  }  
}
