contract PartProduction {

    struct Production {
        string s1;
        string s2;
        uint256 val1;
    }

    Production public production;

    constructor(
        string s1,
        string s2,
        string val1,
    )public {
        production.s1 = s1;
        production.s2 = s2;
        production.val1 = _val1;
    }
}
