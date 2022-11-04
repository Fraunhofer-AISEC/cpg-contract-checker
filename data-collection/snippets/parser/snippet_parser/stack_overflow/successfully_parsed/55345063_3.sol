function getCitizen(address _address) public pure returns(uint,string memory ,string memory ){
            return(citizenMap[_address].age,citizenMap[_address].fName,citizenMap[_address].lName);
}
