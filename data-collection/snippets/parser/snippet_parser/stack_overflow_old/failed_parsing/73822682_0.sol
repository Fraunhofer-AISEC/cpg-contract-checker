function search(address _router, address _asset, 
        uint _amount) external view returns (uint,address,address,address) {
            uint amtBack;
            address token1;
            address token2;
            address token3;

            for(uint i1=0;i1<tokens.length;i1++) {
                for(uint i2=0;i2<stables.length;i2++) {
                    for(uint i3=0;i3<tokens.length;i3++) {
                        amtBack = amount(_router,_asset,tokens[i1],_amount);
                        amtBack = amount(_router,tokens[i1],stables[i2],amtBack);
                        amtBack = amount(_router,stables[i2], tokens[i3],amtBack);
                        amtBack = amount(_router,tokens[i3], _asset,amtBack);    
                       
                        if(amtBack>_amount){
                            token1 = tokens[i1];
                            token2 = tokens[i2];       /
                            token3 = tokens[i3];
                            break;
                        }
                    }
                }
            }
         
            return (amtBack,token1,token2,token3);
        }
