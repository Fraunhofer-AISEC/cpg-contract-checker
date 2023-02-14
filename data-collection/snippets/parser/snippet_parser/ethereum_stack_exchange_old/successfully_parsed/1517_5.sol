function sort(uint[] memory arr) public pure {
    if (arr.length > 0)
        quickSort(arr, 0, arr.length - 1);
}

function quickSort(uint[] memory arr, uint left, uint right) public pure {
    if (left >= right)
        return;
    uint p = arr[(left + right) / 2];   
    uint i = left;
    uint j = right;
    while (i < j) {
        while (arr[i] < p) ++i;
        while (arr[j] > p) --j;         
        if (arr[i] > arr[j])
            (arr[i], arr[j]) = (arr[j], arr[i]);
        else
            ++i;
    }

    
    if (j > left)
        quickSort(arr, left, j - 1);    
    quickSort(arr, j + 1, right);
}
