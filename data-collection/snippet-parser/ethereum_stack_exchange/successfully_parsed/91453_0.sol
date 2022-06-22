contract Sacrifice {
    constructor(address payable _recipient) payable {
        selfdestruct(_recipient);
    }
}
