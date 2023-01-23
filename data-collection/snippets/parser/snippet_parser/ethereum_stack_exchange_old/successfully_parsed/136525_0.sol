
    uint[] public some_arr;



    function test_local_var() public {
        some_arr.push(1);
        some_arr.push(2);
        some_arr.push(3);
        uint[] storage new_arr = some_arr;
        new_arr[0]=3232;
        new_arr.push(4);
        uint[] memory new_arr2 = new uint[](7); 

    } 
