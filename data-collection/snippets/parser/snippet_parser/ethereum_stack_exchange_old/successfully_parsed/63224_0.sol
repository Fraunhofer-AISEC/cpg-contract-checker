pragma solidity ^0.5;

contract SortStruct {


    struct TestStruct {
        address user;
        uint256 value;
    }
    TestStruct[] public testStructArray;
    TestStruct[] public sortedArray;

    function add(uint256 _value) public {


        TestStruct memory test;

        test.value = _value;
        testStructArray.push(test);

    }


    function sort() public {
        sortedArray = sort(testStructArray);
    }


    
    
    
    function sort(TestStruct[] memory  data) internal returns (TestStruct[] memory) {
       quickSort(data, int(0), int(data.length - 1));
       return data;
    }

    function quickSort(TestStruct[] memory arr, int left, int right) internal {
        int i = left;
        int j = right;
        if(i==j) return;
        uint pivot = arr[uint(left + (right - left) / 2)].value;
        while (i <= j) {
            while (arr[uint(i)].value < pivot) i++;
            while (pivot < arr[uint(j)].value) j--;
            if (i <= j) {

                
                TestStruct memory tempSortCandidate;
                tempSortCandidate = arr[uint(i)];
                arr[uint(i)] = arr[uint(j)];
                arr[uint(j)] = tempSortCandidate;

                i++;
                j--;
            }
        }
        if (left < j)
            quickSort(arr, left, j);
        if (i < right)
            quickSort(arr, i, right);
    }

}
