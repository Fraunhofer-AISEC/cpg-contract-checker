function transfer (address factory, uint id) public {

    address compad;
    address[] compowners;
    bool boolean;

    (,,, compad, compowners, boolean) = getComponent(id);

    require(component.transfer == true);

    component.owner = factory;
    pastOwners = pastOwners.push(factory);
}
