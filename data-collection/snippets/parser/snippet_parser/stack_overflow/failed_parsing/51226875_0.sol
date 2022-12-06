contract Test {

    struct Box {
        uint size;
    }

    Box public box;
    box.size = 3;    

    constructor() public {
    }

}
