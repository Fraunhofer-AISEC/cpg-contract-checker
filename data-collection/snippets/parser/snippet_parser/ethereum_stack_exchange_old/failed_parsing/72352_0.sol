import "./Admin.sol";
import "./User.sol";
import "./Operator.sol";
import "./System.sol";


contract Factory is Admin, User, Operator, System{

    uint public stage;
}

contract Admin {
    function adminDoesSomething () { if(stage == 1){ stage = 2} }
}

contract User {
    function userDoesSomething () { if(stage == 2){ stage = 3} }
}

contract Operator {
    function operatorDoesSomething () { if(stage == 3){ stage = 4} }
}

contract System {
    function systemDoesSomething () { if(stage == 4){ stage = 5} }
}
