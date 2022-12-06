contract CtrtFactory {

    Ctrt ctrt;

    function makeCtrt() {
        Ctrt newCtrt = new Ctrt();
        emit CtrtCreated(newCtrt);
    }

    event CtrtCreated(Ctrt ctrt);
}

contract Ctrt {
    function constructor() {}
}
