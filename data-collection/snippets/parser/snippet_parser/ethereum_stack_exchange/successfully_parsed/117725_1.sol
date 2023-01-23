
pragma solidity ^0.8.0;

contract A {

    enum Action { Walk, Fly, Swim }

    function walk() internal pure returns (uint) {
        return 10;
    }

    function fly() internal pure returns (uint) {
        return 50;
    }

    function swim() internal pure returns (uint) {
        return 20;
    }

    function cost(function () internal pure returns (uint) activity) internal pure returns (uint) {
        return activity();
    }

    function foo(Action action) public pure returns (uint) {
        function () internal pure returns (uint) activity;
        if (action == Action.Swim) {
            activity = swim;
        } else if (action == Action.Fly) {
            activity = fly;
        } else {
            activity = walk;
        }

        return cost(activity);
    }
}
