contract A {

uint public a;
uint public someInput;


constructor(uint _someInput) {
    a=5;
    someInput = _someInput;
}

function setA(uint _a) external {
    a = _a;
}  
}

contract A {

uint public a = 5;
uint public someInput;


constructor(uint _someInput) {
    someInput = _someInput;
}

function setA(uint _a) external {
    a = _a;
}
}
