function verifyVote(address pers) public view returns (uint){
    for (uint i = 0; i < personne.length; i++){
        if (pers == personne[i].own) {
            if (personne[i].isVoted == true){
                return 1;
            }
            else{
                return 0;
            }
        }
    }
    return 404;
}
