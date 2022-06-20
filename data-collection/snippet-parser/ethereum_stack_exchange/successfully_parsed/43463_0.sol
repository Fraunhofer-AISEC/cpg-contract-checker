function check(string _address,string _name,string _password) public returns (string)
{

    address add=address(_address);
   if(!checkUser(add))
    {    
        Useraccnts.push(add)-1;
          Users  storage myuser=users[add];
          myuser.name=_name;
          myuser.password=_password;

        return "true";
    }
    else
    {
        return "false";
    }         

}
