    struct buyer{
       uint amount;
       Status status;
    }

    mapping(address=>buyer) public buyers;
    mapping(uint=>address) buyerIndex;
    uint public buyerNum;
    
    function(){
      uint doubleValue=value*2;
      uint amount=msg.value/doubleValue; 
      if(buyers[msg.sender]==null){ 
      buyer abuyer=buyer({amount:amount,status:Status.Created}); 
      buyerNum++;
      buyerIndex[buyerNum]=msg.sender;
      buyers[msg.sender]=abuyer;
    }else{
      buyers[msg.sender].amount+=amount;
    }
      Order(msg.sender,amount*doubleValue,amount);

 }
