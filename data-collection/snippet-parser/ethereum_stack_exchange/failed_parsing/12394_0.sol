pragma solidity ^0.4.2;
contract MemDeposit
{
   struct deposit {
   string[] ss_ids;  
   int[][] si_deposit;
}
mapping(address=>deposit) private si_md;  
.......

function addMemDeposit(address p_memacct,string p_acctstr,uint p_idx2,int p_money) external returns(int) {
   int li_idx1;
   li_idx1 = 0 ; 
   ...
   si_md[p_memacct].si_deposit[p_idx2][li_idx1] = p_money; 
   ...

   }

}   
