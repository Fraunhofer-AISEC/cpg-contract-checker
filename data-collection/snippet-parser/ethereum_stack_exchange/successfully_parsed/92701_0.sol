function bogusFunc(uint256 _val) public
{
    
    user_list.push(msg.sender);
}

function isUser(address _address) public view returns (bool) {
    for (uint256 s = 0; s < user_list.length; s += 1){
        if (_address == user_list[s]) return (true);
    }
    return (false);
}
