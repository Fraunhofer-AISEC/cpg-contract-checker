function isActive()  returns (bool) {
    if(rentCar[msg.sender].active == true){
    return true;
    } else {
    return false;
    }
}
