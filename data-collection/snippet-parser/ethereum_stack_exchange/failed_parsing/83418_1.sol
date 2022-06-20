modifier modi() {
    prolog();
    _;
    epilog();
}
function func() modi() {
    stuff();
}
