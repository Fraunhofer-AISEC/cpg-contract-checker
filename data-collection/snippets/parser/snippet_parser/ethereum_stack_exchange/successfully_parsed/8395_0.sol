contract C {

event EventAdd_One(int a, int b);

event EventAdd_Two(int a, int b);

function add(int a, int b) returns (int) {

    
    EventAdd_One(a, b);

    if (a > 0 && b > 0) {
        return a + b;
        
        EventAdd_Two(a, b);
    } else return 0;
}

}
