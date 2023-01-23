function dijsktra(int uid1,int uid2,uint amt) internal returns(int){
        SPT[uid1].distance=0;
        
        for(uint i=0;i< uidUsers.length;i++){
            int u = minDistance(); 
            SPT[u].included = true;
            
            if (SPT[u].distance < 200){
                
                for(uint j=0;j< uidUsers.length;j++){
                    
                    int v = uidUsers[j];
                    SPTNode storage sv = SPT[v];
                    
                    if(!sv.included && checkJoint(u,v) && AvailableUsers[u].joint_acnt_balance[v] >= amt && sv.distance > SPT[u].distance + 1){
                        
                        sv.distance = SPT[u].distance + 1;
                    }
                }   
            }
        }
        return SPT[uid2].distance;
    }
