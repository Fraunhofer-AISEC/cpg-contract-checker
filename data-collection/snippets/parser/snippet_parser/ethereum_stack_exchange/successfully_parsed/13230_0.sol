pragma solidity ^0.4.10;
contract StrToBytes32Array
{
    function StrToBytes32Array(string p_str) returns(bytes32[]){
        bytes  memory lbts_para;  
        uint li_paralength;   
        string memory ls_new; 
        bytes32 lbt_row;      
        bytes32[] lbt_result32;    
        uint li_rowcount; 
        uint li_temp;  
        uint li_sum; 
        uint li_colidx;  
        uint li_resultlength ; 

        lbts_para = bytes(p_str); 
        li_paralength = lbts_para.length;  
        bytes memory lbts_new = new bytes(32); 
        lbt_result32.length=0; 
        if (li_paralength <= 32 ){  
            assembly {
               lbt_row := mload(add(p_str, 32))
            }
            lbt_result32.length = 1;
            lbt_result32[0] = lbt_row;
        } else {
            
            li_rowcount = li_paralength/32;
            li_temp = li_paralength%32;
            if (li_temp > 0 )
                li_rowcount = li_rowcount +1;
            
            li_sum = li_rowcount *32;
            li_colidx = 0;
            for (uint p = 1;p<= li_sum;p++){
                
                li_temp = p%32;  
                if (li_temp == 0 ){
                    if (p > li_paralength) 
                        lbts_new[li_colidx] = 0x0;
                    else
                        lbts_new[li_colidx] = lbts_para[p - 1];
                    li_colidx = 0;
                    ls_new = string(lbts_new);
                    assembly {
                        lbt_row := mload(add(ls_new, 32))
                    }
                    li_resultlength = lbt_result32.length ;
                    li_resultlength = li_resultlength +1;
                    lbt_result32.length = li_resultlength;
                    lbt_result32[li_resultlength - 1] = lbt_row;
                }else {
                    if (p > li_paralength) 
                        lbts_new[li_colidx] = 0x0;
                    else
                        lbts_new[li_colidx] = lbts_para[p - 1];
                    li_colidx = li_colidx +1;
                }

            }

        }

        return lbt_result32;

    }
}
