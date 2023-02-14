
pragma solidity >=0.7.0 <0.9.0;



contract ReturnAddressesFromMapping{
    mapping (uint8 => address payable[])  playersByNumber; 
    uint8[] public numbers; 

    function enterNumber(uint8 number) public {
   
     playersByNumber[number].push(payable(msg.sender)); 
        numbers.push(number); 
    }


function getPlayers(uint8 number) public  view returns(address payable[] memory){
     return playersByNumber[number];


}

}```

