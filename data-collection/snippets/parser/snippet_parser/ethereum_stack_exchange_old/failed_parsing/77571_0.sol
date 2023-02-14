function Renting() public {

    checkUser[owner] = true;
    struct govt = Person(owner, 'Owner', 'Owner', 0, 'None',  new uint[](0), new uint[](0));

    addressToPerson[owner] = govt;
}
