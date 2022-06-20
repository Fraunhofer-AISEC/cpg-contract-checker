import "./DaughterTemplate";
    .....
    function getter(playerAddress) public view returns (uint data)
    {
        address daughter = activeDaughters[playerAddress];
        if (daughter != address(0)) {
            DaughterTemplate d = DaughterTemplate(daughter);
            data = d.data;
        }
    }
