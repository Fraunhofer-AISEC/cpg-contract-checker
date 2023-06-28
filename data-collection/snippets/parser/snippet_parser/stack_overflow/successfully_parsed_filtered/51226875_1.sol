contract Test {

    struct Box {
        uint size;
    }

    Box public box;

    constructor() public {
        box.size = 3;
    }

}
