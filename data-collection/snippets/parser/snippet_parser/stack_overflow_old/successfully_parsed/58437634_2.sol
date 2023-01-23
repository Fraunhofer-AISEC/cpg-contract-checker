pragma solidity >=0.4.22 <0.5.13;
contract Max{
    mapping(address => uint256) private balaces;
    mapping(address => role) private roles;
    enum role{
        Admin,
        Manager,
        User
    }

    constructor() public{
        balaces[msg.sender] = 1000;
        roles[msg.sender] = role.Admin;
    }

    function getRoleOf(address ad) public returns(string txt){
        if(roles[ad] == role.User){
            txt = "User";
            return;
        }
        if(roles[ad] == role.Manager){
            txt = "Manager";
            return;
        }
        if(roles[ad] == role.Admin){
            txt = "Admin";
            return;
        }
        return "Нет такого пользователя";
    }
}
