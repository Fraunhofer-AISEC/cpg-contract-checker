mapping (address => bool) public registered_user;


registered_user[msg.sender] = true;


require(registered_user[msg.sender],'Not registered');


registered_user[msg.sender] = false;
