    function createtask(address _user1, string memory _task) public {
        if (user != _user1) {
            user=_user1;
        }

        userdata memory _data = userdata({
            task: _task,
            isdone: false
        });
        userinfo.push(_data);

        usertask[user] = _data;
    }
