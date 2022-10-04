pragma solidity ^0.4.4;

contract Contract_A {

address public b_addr;
function Contract_A(){

 }
  function create() {
    Contract_B bb = new Contract_B();
    b_addr = address(bb); }

function fetch(){
    Contract_B cc = Contract_B(b_addr);
    cc.change();}    
}

contract Contract_B {

    address public c_addr;
  uint public val;
  function Contract_B(){
   val=7;}
   function change(){
   val+=90;}

   function create() {

    Contract_C cc = new Contract_C();
    c_addr = address(cc); 

   }
}


contract Contract_C {

    
}
