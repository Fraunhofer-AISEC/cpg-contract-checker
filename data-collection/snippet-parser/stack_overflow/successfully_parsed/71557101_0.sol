
pragma solidity ^0.8.0;

contract Types{
uint[] data;
uint8 j = 0;
function loop() public returns(uint){

    do{
        j++;
    data.push(j);
    }

 while(j < 5);

return data;  
}

}
