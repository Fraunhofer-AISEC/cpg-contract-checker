import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract Contract {                                                            
    using strings for *;                                                       

    function smt() public pure {                                               
        strings.slice memory s = "This-Is-A-Problem".toSlice();                
        strings.slice memory delim = "-".toSlice();                            
        string[] memory parts = new string[](s.count(delim));                  
        for (uint i = 0; i < parts.length; i++) {                              
           parts[i] = s.split(delim).toString();                               
        }                                                                      
    }                                                                          
}  
