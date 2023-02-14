import "./Suu.sol"

contract foo {

    Suu suuContract = Suu("CONTRACT_ADDRESS_OF_SUU")
  
  function mul(uint a , uint b ) public view returns(uint){

  uint res=suuContract.sums(a,b); 
     return res*10;

}
}