
contract ParentVehical{



function startVehicle() public view returns( string memory){

string memory start = "The vehicle has just started" ;

return (start);

}



function accVehicle() public view returns( string memory){

string memory accelerate = "The Vehicle has just Accelerated" ;

return (accelerate);

}



function stopVehicle() public view returns( string memory){

string memory stop = "The Vehicle has just Stopped" ;

return (stop);

}



function serviceVehicle() public view returns( string memory){

string memory service = "The Vehicle is being serviced" ;

return (service);

}

}```
