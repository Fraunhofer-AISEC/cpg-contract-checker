function getActivity(uint uid) public constant returns(bytes32, uint8) {
   return(activities[uid].name, activities[uid].durationInDaysMinusOne + 1);
}
