contract Catalog{
    address[] internal array;


    function pushItem(address _el) external{
         array.push(_el);
    }

    function getArray() external returns(address[]){
         return array;
    }
 }
