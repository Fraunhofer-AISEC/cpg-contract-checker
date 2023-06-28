user_details[] user_list;    

function registerUser(user_details memory _user) public {

    
    bool found = false;

    for (uint i = 0; i < user_list.length; i++) {
        if (user_list[i] == _user)
            found = true;
    }
}
