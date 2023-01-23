function transfer_balance(address recipient_address, uint amount) 
public returns(bool) {
    if(msg.sender == owner){
         if (amount <= get_balance()){
             
             recipient_address.transfer(amount);<-- error here
             return true;
         }else{
            return false;
        }
    }else{
        return false;
    }
 }
