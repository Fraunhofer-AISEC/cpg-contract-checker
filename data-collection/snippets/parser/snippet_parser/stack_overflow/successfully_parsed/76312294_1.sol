 function insert_candidates_Information(string memory seat,string[] memory cand_name,string[] memory cand_image,string[] memory party_name,string[] memory election_sign) public returns(bool){
        if(election_Date_Not_set() && access){
            if(!hasTimePassedPKT(startTime.Year,startTime.Month,startTime.Day,startTime.Hour,startTime.Minute)){
                (string[] memory _namePlusparty) = glue_candname_partyname(seat,cand_name,party_name);
                (string[] memory _cand_key) = check_candkey_Char(_namePlusparty);
                insert_Party_Information(party_name);
                for(uint i=0; i < cand_name.length; i++){
                    name_party_vote[_cand_key[i]] = Candidate(cand_name[i],cand_image[i],party_name[i],election_sign[i],0);
                    name_party_vote_record.push(_cand_key[i]);
                }
                if(!seat_Already_Exist(seat)){
                    seat_wise_candidates[seat] = _cand_key;
                    seat_wise_candidates_record.push(seat);
                    seats[seat] = true;
                }else{
                    for(uint i=0; i < cand_name.length; i++){
                        seat_wise_candidates[seat].push(_cand_key[i]);
                    }
                }
                information = true;
                return true;
            }
            information = false;
            return false;
        }
        information = false;
        return false;
    } 
