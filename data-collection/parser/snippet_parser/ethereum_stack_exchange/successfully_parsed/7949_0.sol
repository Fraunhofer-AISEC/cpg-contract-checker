contract X{

uint constant var1=now;
uint var2=now;

function checkConstant() returns(uint,uint){
    return (var1,var2);
}} 
