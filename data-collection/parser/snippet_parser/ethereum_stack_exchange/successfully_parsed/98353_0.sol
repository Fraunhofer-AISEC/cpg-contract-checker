struct Cow{
    uint age;
    uint name;
}

Cow[] cows;


function createCows(Cow[] memory _cows) public {
    cows =_cows;
}
