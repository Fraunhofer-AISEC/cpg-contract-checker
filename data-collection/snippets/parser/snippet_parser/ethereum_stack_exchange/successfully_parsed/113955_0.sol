contract MyContract{
struct User{
    uint user_id;
    string user_name;
    mapping(uint=>uint) edge_list;
}

mapping(uint=>User) users;

function registerUser(uint user_id, string user_name) public{
        users[user_id] = User(user_id, user_name);
}

function createAcc(uint user_id_1, uint user_id_2) public{
        users[user_id_1].edge_list[user_id_2] = 50;
        users[user_id_2].edge_list[user_id_1] = 50;
}
}