library Helper{

   function add(uint256 _id, 
               bytes32[] memory list, 
               mapping(uint256=>mapping (bytes32 => bytes32)) storage table)
            public {
       for( uint i=0; i< list.length; i++ ){
           table[_id][list[i]] = list[i];
        }
       }
}

contract A{
    mapping(uint256=>mapping (bytes32 => bytes32)) public table;
    function add(uint256 _id, 
                bytes32[] memory _list) 
                external {
        Helper.add(_id, _list, table);
    }

}

