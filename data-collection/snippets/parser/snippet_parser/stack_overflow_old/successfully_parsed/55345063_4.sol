function getCitizen(address _address) public view returns(uint,string memory ,string memory ){
    return(citizenMap[_address].age,citizenMap[_address].fName,citizenMap[_address].lName);

}
