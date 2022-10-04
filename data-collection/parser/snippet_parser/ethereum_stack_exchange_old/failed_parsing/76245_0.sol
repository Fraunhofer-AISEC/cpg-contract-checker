
event myEvent(uint indexed eventDate, address indexed sender, myArray[] eventList, uint eventBalance);


function setEvent() public {
    
    myEvents.push(now) -1;

    uint totalBalance = getTotalBalance();

    emit myEvent(now, msg.sender, myArray, totalBalance);
    }
