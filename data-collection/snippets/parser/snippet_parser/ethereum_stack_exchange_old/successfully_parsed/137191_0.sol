    
    function _remove(address[] storage arr, address token) internal {
        uint len = arr.length;
        for(uint i; i < len; ++i) {
            if (arr[i] == token) {
                arr[i] = arr[arr.length - 1];
                arr.pop();
                break;
            }
        }
    }
    ```
