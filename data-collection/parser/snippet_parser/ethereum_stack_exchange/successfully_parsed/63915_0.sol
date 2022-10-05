contract stateVariable{
uint stateVariable1=10;
uint stateVariable2=20;
uint stateVariable3=30;
event log(uint stateVariable);
function display() public
{
   
   emit log(stateVariable1); 
   emit log(stateVariable2); 
   emit log(stateVariable3); 
}
}