function send_with_exceptions(address[] recipients, address[] exceptions) public {
        for(uint i=0;i<recipients.length;i++){
            bool flag;
            for(uint k=0;k<exceptions.length;k++){
                if(recipients[i]==exceptions[k]){
                    flag = true;
                }
            }
            if(!flag){
                
            }
        }
    }
