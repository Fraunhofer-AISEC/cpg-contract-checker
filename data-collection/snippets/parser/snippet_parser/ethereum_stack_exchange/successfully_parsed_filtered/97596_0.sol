contract mycontract{

uint threshold = 5;

uint value;

function myFunction(){
   value = value + 1
   require(value <= threshold)
   
}
}
