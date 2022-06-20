contract Contract {

    struct Set {
        uint[] values;
        mapping (uint => bool) is_in;
    }

    Set my_set;

    function add(uint a) public {
        if (!my_set.is_in[a]) {
            my_set.values.push(a);
            my_set.is_in[a] = true;
        }
    }
}
