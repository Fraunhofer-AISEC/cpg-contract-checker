pragma solidity 0.6.0;

contract Example {
    bool _isActive = true;

    modifier checkActive() {
        require (_isActive);
        _;
    }

    function do1() checkActive public {
        
    }

    function do2() checkActive public {
        
    }

    function setActivity(bool isActive) public {
        
        _isActive = isActive;
    }
}
