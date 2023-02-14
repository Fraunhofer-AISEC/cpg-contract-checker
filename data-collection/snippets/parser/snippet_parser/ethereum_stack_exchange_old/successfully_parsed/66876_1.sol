pragma solidity 0.5.1;

contract Scope {

    struct Human {
        bool b;
    }

    Human[] humans;

    modifier checkScope {
        Human storage human = humans[2];
        _;
    }

    function doSomething() public view checkScope returns(bool) {
        
        return humans[2].b; 
    }
}
