struct Citizens{

    uint age;
    string fName;
    string lName;

}

mapping(address => Citizens) citizenMap;

address [] citizenArray;

function setCitizen(address _address,uint _age,string memory _fName,string memory _lName) public{

    
     Citizens storage citizen=citizenMap[_address];


    citizen.age=_age;
    citizen.fName=_fName;
    citizen.lName=_lName;

    citizenArray.push(_address) -1;

}

function getCitizen(address _address) public pure returns(uint,string memory ,string memory ){
    return(citizenMap[_address].age,citizenMap[_address].fName,citizenMap[_address].lName);

}

function getCitizenAddress()public returns(address[]){
    return citizenArray;
}

}
