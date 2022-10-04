pragma solidity ^0.5;

contract SortStruct {

    struct TestStruct {
        address user;
        uint256 value;
    }


    mapping (uint => uint) helper;

    TestStruct[] public testStructArray;
    TestStruct[] public sortedArray;

    function add(uint256 _value) public {

        TestStruct memory test;

        test.value = _value;
        test.user = msg.sender;
        testStructArray.push(test);

    }

    function sort () public {


        for (uint i = 0; i < testStructArray.length; i++) {


            helper[i] = 0;


            for (uint j = 0; j < i; j++){


                if (testStructArray[i].value < testStructArray[j].value) {


                    if(helper[i] == 0){
                        helper[i] = helper[j];
                    }


                    helper[j] = helper[j] + 1;
                }
            }


            if(helper[i] == 0) {
                helper[i] = i + 1;
            }
        }


        var lengthSortedArray = sortedArray.length;
        for (uint i = 0; i < testStructArray.length; i++) {
            if (i < lengthSortedArray) continue;
            sortedArray.push(TestStruct(msg.sender, 0));
        }


        for (uint i = 0; i < testStructArray.length; i++) {
            sortedArray[helper[i]-1] = testStructArray[i];
        }
    }
}
