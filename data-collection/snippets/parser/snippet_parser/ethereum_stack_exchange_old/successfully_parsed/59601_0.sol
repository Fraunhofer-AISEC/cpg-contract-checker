address[] public users;
function userCounter(address user) public view returns(uint){
        uint counter;
        for(uint i; i<users.length; i++){
            if(users[i] == user){
                counter++;
            }
        }
        return counter;
    } 
