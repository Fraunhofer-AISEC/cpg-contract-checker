pragma solidity ^0.5.1;

contract arraytest{

struct Player {
    uint estimation;
    
    
}

Player[] public playersArr;
address[] public playersaddress;

    function setbid(uint _prediction, address _playeraddr) public{
    Player memory player;
    player.estimation = _prediction;
    playersArr.push(player);
    playersaddress.push(_playeraddr);

}

    function getWinnersArray() public view returns (address[] memory) {
    uint i=0;


    uint counter = 0;
    uint j=1;
    uint minvalue=playersArr[i].estimation;

    address[] memory winners = new address[](j);
    winners[counter] = playersaddress[i];
    counter++;


    for (i = 1; i < playersArr.length; i++) {



        if (playersArr[i].estimation < minvalue) {

            minvalue=playersArr[i].estimation;
            delete winners;

            winners = new address[](j);
            counter=0;

            winners[counter] = playersaddress[i];
            counter++;
        }else if(playersArr[i].estimation == minvalue){

            
        }
    }
    return (winners);
}
}