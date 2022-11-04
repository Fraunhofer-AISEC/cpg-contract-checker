function checkProsumerOrConsumer(address payable _user, int _newEnergy, int _pastEnergy) public payable {
        if(_newEnergy < 0){ 
            if(_pastEnergy < 0){
                updateDemandEnergy(-_newEnergy, -_pastEnergy);
            }
            else if(_pastEnergy>0){
                updateAvailableEnergy(0, _pastEnergy);
                updateDemandEnergy(-_newEnergy,0);
            }
            else{
                updateDemandEnergy(-_newEnergy,0);
            }
            
            consumer(_user, -_newEnergy);
        }
        else{ 
            if(_pastEnergy > 0){
                updateAvailableEnergy(_newEnergy, _pastEnergy);
            }
            else if(_pastEnergy < 0){
                updateDemandEnergy(0, -_pastEnergy);
                updateAvailableEnergy(_newEnergy,0);
            }
            else{
                updateAvailableEnergy(_newEnergy,0);  
            }
            
            prosumer(_user, _newEnergy);
        }
    }
