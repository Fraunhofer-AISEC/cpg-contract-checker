
function getBikes() public view returns (Bike[] memory){
    return bikes;
}


function changeAvailability() public {
    bikes[1].isAvailable=false;
}
