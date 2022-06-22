library Party {
    event Pinata(uint candies);

    function showPinata() internal {
        emit Pinata(123);
    }
}

contract Birthday {
    function celeb() public {
        emit Party.Pinata(222);
    }
}

