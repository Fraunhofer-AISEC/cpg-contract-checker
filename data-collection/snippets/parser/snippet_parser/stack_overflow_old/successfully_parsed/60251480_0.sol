contract A {
    string public name;
    constructor(string tokenName) public {
        name = tokenName;
    }
}


contract B is A {
    constructor() A("My tokenName") public {

    }
}


contract C is A {
    constructor(string tokenName) A(tokenName) public {

    }
}
