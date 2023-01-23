contract Stealing{
   
   mapping (address => uint) balances;
   mapping (address => bool) frozenAccount;
   mapping (address => uint) allowed;
   function transferFrom ( address from , address to , uint value )public returns ( bool success ) {
      
      if( frozenAccount [ msg. sender ]) return false ;
         
      if( balances [ from ] < value ) return false ;
         
      if( allowed [ from ][ msg. sender ] >= value ) return false ;
         
      if( balances [to] + value < balances [to ]) return false ;
      balances [ from ] -= value ;
      allowed [ from ][ msg . sender ] -= value ;
      balances [to] += value ; 
      transferFrom (from , to , value );
    return true ;
 }
}
