import "./Factory.sol";    

contract Factory {

    uint public stage;
}

contract Admin is Factory {
    function adminDoesSomething () { if(stage == 1){ stage = 2} }
}

contract User is Factory {
    function userDoesSomething () { if(stage == 2){ stage = 3} }
}

contract Operator is Factory {
    function operatorDoesSomething () { if(stage == 3){ stage = 4} }
}

contract System is Factory {
    function systemDoesSomething () { if(stage == 4){ stage = 5} }
}
