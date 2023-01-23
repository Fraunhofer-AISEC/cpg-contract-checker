
pragma solidity ^0.8.7;
contract Lottery{

    struct Participant{
        address participantAddr;
        uint noOfLotts;
    }
    
    address public manager;

    Participant [] public participantList;
   

    constructor(){
    manager = msg.sender;
    }
    
    function participate () external payable{
        require(msg.value == 2 ether,"The amount must be equal to 2 Ethers");
        for(uint i = 0; i<=participantList.length; i++){   
        if(participantList[i].participantAddr == msg.sender){
            participantList[i].noOfLotts++;
            }

        else{
            participantList.push(Participant(msg.sender,1));
        }

    
        }
    }
        
    }
`````````````````````````````````
