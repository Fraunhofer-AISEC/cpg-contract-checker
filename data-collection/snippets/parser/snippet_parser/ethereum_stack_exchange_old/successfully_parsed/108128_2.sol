function addVotersList(string[] calldata _names,uint[] calldata _ids , address[] calldata _voters)public  {
           
                     for (uint i = 0; i < _names.length; i++)
                       { 
                        global_names[i]=_names[i];
                        global_ids[i]=_ids[i];
                        global_voter[i]=_voter[i];
                           
                       }

        }
