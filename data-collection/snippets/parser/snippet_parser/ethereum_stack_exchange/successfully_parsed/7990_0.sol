contract X{
uint a=12+1 ether;

function checkConstant(uint conversionRate) constant returns(uint integer, uint decimal){

    integer= a / conversionRate;
    decimal= a % conversionRate;
}

} 
