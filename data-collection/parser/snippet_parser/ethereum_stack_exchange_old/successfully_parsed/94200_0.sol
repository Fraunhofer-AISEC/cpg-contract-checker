function listBest() public view returns(uint, address){
    for(uint p = 0; p < number; p++) {
        return(listScores, listScoredPeople[p]);
    }
}
