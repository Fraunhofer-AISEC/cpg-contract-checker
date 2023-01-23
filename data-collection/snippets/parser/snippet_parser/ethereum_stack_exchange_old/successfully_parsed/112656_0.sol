







pragma solidity ^0.8.1;

contract SignUp{
    struct TheUser{
        uint id;
        string name;
        uint Password;
        uint ConfirmPassword;
    }
    
    mapping(uint=>TheUser)public TheUsers;
    uint public UserCount;
    
    function CreateUser(uint _id,string memory _name,uint _password,uint _confirmpassword)public{
        uint i = fetechTheUserId(_id);
        uint n = fetchTheUserName(_name);
        
        require(!TheUsers[i].id==_id,"User Is Already Exist");


        
        require(!TheUsers[n].name==_name,"User Name Is Already Exist");

        
        require(_password==_confirmpassword,"The Password And ConfirmPassword Must Be Same");

        
        TheUsers[UserCount].id=_id;
        TheUsers[UserCount].name=_name;
        TheUsers[UserCount].Password=_password;
        TheUsers[UserCount].ConfirmPassword=_confirmpassword;

    }
    
    function fetechTheUserId(uint _id)public returns(uint){
            for(uint i=0;i<=UserCount;i++){
                if(TheUsers[i].id==_id){
                    return i;
                }
            }
    }
    function fetchTheUserName(string memory _name)public returns(uint){
        for(uint i=0;i<=UserCount;i++){
            if(TheUsers[i].name=_name){
                return i;
            }
        }
    }
}
