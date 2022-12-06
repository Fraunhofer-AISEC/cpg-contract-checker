contract Market {

    struct good {
        address owner;
        bytes32 goodName;
        uint amount;
    }

    mapping(bytes32 => good[]) market;

    uint counter;

    function Market() {}

    function putGood(bytes32 name, address owner, uint quantity) public returns (uint) {
        good memory newGood = good(owner, name, quantity);
        market[name].push(newGood);
        counter++;
        return counter;
    }

  function getGood(bytes32 good) public view returns (bytes32, uint)     {
    return (market[good].owner, market[good].goodName, market[good].amount);
}
}
