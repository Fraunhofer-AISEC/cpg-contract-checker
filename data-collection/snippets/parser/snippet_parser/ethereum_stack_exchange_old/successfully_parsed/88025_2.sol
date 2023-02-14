string public stor = "banana";

function test(string calldata calld) external view {
    string memory memo = "pizza";

    foo(memo, stor);
    foo(calld, stor);  
    foo(stor, stor);   
    
    foo(memo, stor);
    
    
}

function foo(string memory, string storage) internal view {
    
}


