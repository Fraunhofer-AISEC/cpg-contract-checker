contract X {
    mapping (address => uint) l;

    function lock() {
        l[msg.sender] = now;
    }

    function unlock() {
        delete l[msg.sender];
    }

    function unlock2() {
        if(l[msg.sender] > 0)
            delete l[msg.sender];
    }
}
