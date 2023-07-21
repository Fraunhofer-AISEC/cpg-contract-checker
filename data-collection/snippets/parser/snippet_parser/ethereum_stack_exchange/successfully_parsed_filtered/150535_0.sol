pragma solidity >=0.8.4;

    struct state_type {
        bytes   b;
        uint256 x_index;
        uint256 x;
    }

    
contract SolidtyStructLayout {
    event EmitVal(bytes32 v);

    function writeStruct() public returns(uint256 x_ind, uint256 x_val, bytes memory b) {

        state_type memory local_var;
        local_var.x_index = 8;
        local_var.x = 9;
        local_var.b = new bytes(0x20 * 3);

        bytes32 v;
        
        assembly{
                v := mload(local_var)
                 mstore(
                      add(mload(local_var), 0x20),1
                    )
                    mstore(
                      add(mload(local_var), add(0x20, 0x20)), 2
                    )
                    mstore(
                      add(mload(local_var), add(0x20, 0x40)), 3)
                }
        emit EmitVal(v);                
        return(local_var.x_index , local_var.x , local_var.b);
    }
}
