

pragma solidity >=0.6.0 <0.8.0;


contract Parent {

    public string name;

    constructor(string _name) {
        name = _name;
    }
}

contract Child is Parent {

    constructor() Parent("Guybrush Threepwood")  {
         
    }
}
