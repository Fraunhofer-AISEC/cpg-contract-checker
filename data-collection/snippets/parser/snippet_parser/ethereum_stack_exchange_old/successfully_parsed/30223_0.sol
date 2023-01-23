pragma solidity ^0.4.15;


contract PrivateConstructor {
    string public title;

    function PrivateConstructor() private {
        title = "Private Constructor";
    }

}
