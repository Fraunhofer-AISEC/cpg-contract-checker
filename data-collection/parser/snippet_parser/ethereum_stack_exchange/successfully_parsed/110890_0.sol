function getInstructor(address _address) view public returns (uint, string memory, string memory) {
    return (instructors[_address].age, instructors[_address].fName, instructors[_address].lName);
}
