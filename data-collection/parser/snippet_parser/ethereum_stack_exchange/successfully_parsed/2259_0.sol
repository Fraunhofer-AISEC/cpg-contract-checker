contract A {
    function indirect() {
        B.doit();
    }
    function direct() {
        C.doit();
    }
}

library B {
    function doit() {
        C.doit();
    }
}

library C {
    function doit() {
        msg.sender.send(this.balance);
    }
}
