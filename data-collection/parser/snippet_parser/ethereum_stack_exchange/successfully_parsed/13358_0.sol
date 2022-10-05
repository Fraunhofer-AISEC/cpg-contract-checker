contract PopArray {
    string[] public string_arr;

    function PopArray() {
        
        string_arr = ['zero', 'one', 'two', 'three', 'four'];
    }

    
    function pop_string () returns (string member) {
        member = string_arr[string_arr.length-1]; 
        string_arr.length = string_arr.length-1;  
        return member;
    } 

    
    function broken_pop_string () returns (string) {
        string member = string_arr[string_arr.length-1];
        string_arr.length = string_arr.length-1;
        return member;
    }
}
