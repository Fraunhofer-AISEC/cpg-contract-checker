 function adopt(string calldata dog_breed) external payable {
             require(msg.value >= 1 ether ,"Min 1 ether needs to be transfered");
            require(user_list[msg.sender].user_allowed_to_adopt,"User not 
            allowed to participate for adoption");
            require(!user_list[msg.sender].adopted,"User has already 
            adopted the dog");
            
        User memory user=user_list[msg.sender];
        user.adopted=true;
        user_list[msg.sender]=user;
    }
