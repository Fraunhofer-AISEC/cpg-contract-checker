Val storage valReceiver = _balances[recipient];  
Stk storage stk = _stakes[recipient];   
      
         if (valReceiver.index>0) {   
              
        } else {
            uniqueKeyList.push(recipient);  
            stk.index = _globalHolderIndex;    
            valReceiver.index = _globalHolderIndex;  
            _globalHolderIndex+=1;  
        }
