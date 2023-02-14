function getPeopleAges() public view returns (uint256[] memory) {
        uint256[] memory temp = new uint256[](peopleArray.length);
        for (uint8 i = 0; i < peopleArray.length; i++) {
            temp[i] = peopleArray[i].age;
        }

        return temp;
    
}
