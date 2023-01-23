uint[] public theArray;




function myFunction(uint bigNumber) payable public {
         if(msg.value == 0.01 ether){
         theArray.push(bigNumber);}
else {if (msg.value == .05 ether){
            for (int i; i<50;i++)
            theArray.push(bigNumber);

        }
else { 
    revert();
}
}}
