contract A {

    string private V;

}

contract B is A{
    ...
    can't change A.V
    ...
}
