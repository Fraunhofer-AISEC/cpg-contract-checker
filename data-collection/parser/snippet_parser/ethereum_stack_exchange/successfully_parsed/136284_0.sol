
pragma solidity ^0.4.26;
contract Genetic{               
uint len = parent1.length;
uint []   parent1;
uint  []   parent2 =new uint [](len);
function setValue() external{
    parent1=[1,1,0,1,0,0,0,1,1,0];
    parent2=[0,0,0,1,1,1,0,0,1,1];
}
function getValue() public  view  returns (uint [] memory ,uint[] memory){
return  (parent1 , parent2);
}
function singlPoint() public view  returns (uint[]){
    
    uint[] memory  child  = new uint [](len);
    (uint[] memory father, )= getValue();
    ( ,uint[]  memory mother ) = getValue();
    uint  cop = len / 2;
    for ( uint i=0; i < cop ; i++){
         child[i] = father[i];
    }
    for(uint j =cop ; j <= len;j++){
             child[j] = mother[j];
         
    }   
                    
  return   (child); 
}

}
