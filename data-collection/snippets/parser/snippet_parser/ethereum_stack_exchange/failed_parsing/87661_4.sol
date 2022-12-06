...

contract B is A {
    constructor(uint _y) A(_y * _y) public {}
}
