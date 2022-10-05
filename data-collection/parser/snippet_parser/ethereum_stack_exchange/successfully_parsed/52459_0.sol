interface IOne {
    
}

interface ITwo {
    
}

contract One is IOne {
    
}

contract Two is ITwo {
    
}

contract Three is Ownable {
    IOne public one;
    ITwo public two;
    constructor(IOne _one, ITwo _two) public {
        one = _one;
        two = _two;
    }
    function setOne(IOne _one) external onlyOnwer {
        one = _one;
    }
    function setTwo(ITwo _two) external onlyOnwer {
        two = _two;
    }
}
