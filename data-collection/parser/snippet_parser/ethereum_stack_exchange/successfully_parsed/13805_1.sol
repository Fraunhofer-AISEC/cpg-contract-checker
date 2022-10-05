import "DataSet.sol";  
contract ProductContract {  
    using DataSet for *;  
    DataSet.Data d;  
    mapping (uint => uint) IDToVal;  
    function register (uint p_id, uint val) returns (bool registered) {  
        IDToVal[p_id] = val;  
        registered = true;  
    }  
    function getVal (uint p_id) returns (uint v) {  
         return IDToVal[p_id];  
    }  
}
