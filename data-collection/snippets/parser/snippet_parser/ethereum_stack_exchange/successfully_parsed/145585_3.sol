    function provide(address bookletOwner)
        external
        isOwner
        returns(CarBooklet booklet)
    {
        booklet = new CarBooklet(bookletOwner);
        emit BookletCreated(address(booklet));
    }
