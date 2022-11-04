    A a = A(<address where A is deployed);
    address AOwner = a.owner();
...
    assert(AOwner,BOwner,"Owner's should both be the same");
