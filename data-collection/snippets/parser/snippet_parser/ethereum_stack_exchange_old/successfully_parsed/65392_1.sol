 function PetChangeTransaction( address _PETSITTER, address _master, uint _ownerpirce ) PetSitterModifyInfo(_PETSITTER) public  payable {
       
       require(PetSitters[msg.sender].petsitterwallet >= _ownerpirce);
       require(_ownerpirce == msg.value);
       PetSitters[msg.sender].petsitterwallet -= _ownerpirce;
       require(PetSitters[msg.sender].petsitterwallet + _ownerpirce >= PetSitters[msg.sender].petsitterwallet);
       require(LovePeter[_master].lovepetwallet + _ownerpirce >= LovePeter[_master].lovepetwallet);
       LovePeter[_master].lovepetwallet += msg.value;
    }

    function PetChange(address _ownerseller, address _petsitter, address _MASTER, uint _ownerpirce) MasterInfo(_MASTER) public {
        LovePeter[msg.sender].lovepetwallet -= _ownerpirce;
        require(Owners[_ownerseller].ownerwallet + _ownerpirce >= Owners[_ownerseller].ownerwallet);
        Owners[_ownerseller].ownerwallet += _ownerpirce;
        Owners[_ownerseller].owner = PetSitters[_petsitter].petsitter;
    }
