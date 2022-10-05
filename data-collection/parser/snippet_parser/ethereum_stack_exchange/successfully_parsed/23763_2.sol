contract Parent {
    uint counter;

    function createChild() {
        Child child = new Child();
        ++counter;
    }
}
