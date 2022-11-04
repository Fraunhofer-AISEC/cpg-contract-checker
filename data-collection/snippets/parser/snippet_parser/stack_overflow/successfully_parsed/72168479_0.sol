function fun(uint _value) public pure returns(string memory)
   {
       string memory _return;
       if(_value > 100){
           _return = "Greater than 100";
       }else if(_value < 100){
           _return = "Lower than 100";
       }else{
           _return = "Equal to 100";
       }

       return _return;
   }
