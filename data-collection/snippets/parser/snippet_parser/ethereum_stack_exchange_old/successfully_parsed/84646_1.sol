library Party {
    function showPinata() internal {
        emit Birthday.Pinata(222);
    }
}

contract Birthday {
    event Pinata(uint candies);

    function celeb() public {
        emit Pinata(123);
    }
}

