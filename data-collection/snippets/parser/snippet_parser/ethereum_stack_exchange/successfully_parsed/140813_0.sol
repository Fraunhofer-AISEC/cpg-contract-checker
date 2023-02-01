struct userdata
{
    string task;
    bool isdone;
}

userdata[] public userinfo; 

    address public user;

   
    mapping (address=>userdata[]) public usertask;

    constructor (address _user)
    {
        user=_user;

    }

    function createtask(address _user1, string memory _task)public
    {
        if(user!=_user1)
        {
            user=_user1;
        }
        userinfo.task.push(_task);
        userinfo.isdone.push(false);

        usertask[user]=userinfo;

    }
