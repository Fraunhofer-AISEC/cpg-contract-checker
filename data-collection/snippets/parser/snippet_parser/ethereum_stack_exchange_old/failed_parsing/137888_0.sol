code 1 :mapping (uint8 => address payable[])  playersByNumber; 
code 2 : uint8[] public numbers; 

    function enterNumber(uint8 number) public {
   
     playersByNumber[number].push(payable(msg.sender)); 
        numbers.push(number); 
    }

function getPlayers() public  view returns (address[] memory  ){
 `what code should be here?. `

}
