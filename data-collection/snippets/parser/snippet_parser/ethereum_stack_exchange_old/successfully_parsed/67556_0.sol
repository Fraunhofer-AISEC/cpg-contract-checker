 uint [] medsToBeDeveloped;

 function returnProductID() external returns(uint){
    uint randNum = medsToBeDeveloped.length;
    medsToBeDeveloped.push(randNum);
    potentialMedsToManufacturer[randNum] = msg.sender;
    return(randNum);
}
