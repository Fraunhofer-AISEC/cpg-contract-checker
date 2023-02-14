pragma solidity 0.4.26;

interface IBaseContract {
    function func(uint _x) external view returns (bool);
}

contract BaseContract is IBaseContract {
    function func(uint _x) external view returns (bool) {
        return _x == 1;
    }
}

contract DerivedContract is BaseContract {
    uint public x;
    function func(uint _x) external view returns (bool) {
        return _x == x;
    }
}
