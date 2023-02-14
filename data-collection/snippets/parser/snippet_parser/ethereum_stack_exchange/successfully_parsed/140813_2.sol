    struct userdata
    {
      string task;
      bool isdone;
    }

    userdata[] userinfo; 

    address user;

    mapping (address=>userdata[]) usertask;

    function createtask(address _user1, string memory _task)public
    {
        if(user!=_user1)
        {
            user=_user1;
        }
        userinfo.push(userdata(_task,false));
        usertask[user]=userinfo;
    }

    function readtask(address _user1, uint index) public view returns (userdata memory)
    {
        userdata storage uses=usertask[_user1][index];
        return uses;
    }

    function updatetask(address _user1, uint index) public
    {
        usertask[_user1][index].isdone=true;
    }

    function deletetask(address _user1, uint index) public 
    {
        delete usertask[_user1][index].isdone;
    }

    function taskcount() public view returns (uint)
    {
       return usertask[msg.sender].length;
    }
