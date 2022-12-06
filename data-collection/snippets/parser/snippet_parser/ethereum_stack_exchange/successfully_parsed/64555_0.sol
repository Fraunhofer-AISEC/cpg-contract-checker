function randomnumber() public returns (uint){
    for(uint i=1; i< 50; i++){
    uint random = uint(keccak256(block.blockhash(block.number -1 ),RandomNum)) % 50 ;

        Numbers.push(random); 
        RandomNum += random;
   }

     }

function getnumbers() public view returns(uint[]){
    return  Numbers;
}
