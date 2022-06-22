{ 
    function a() returns (int a, string b) 
    { 
        return (1, "Hello"); 
    } 

    function b() 
    { 
        int A; 
        string memory B; 

        
        (A, B) = a(); 

        
        (A,) = a(); 

        
        (, B) = a(); 
    } 
} 
