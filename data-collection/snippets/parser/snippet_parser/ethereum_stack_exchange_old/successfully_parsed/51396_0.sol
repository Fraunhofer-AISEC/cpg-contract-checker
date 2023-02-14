pragma solidity ^0.4.0;

contract work_and_array {
    uint8[1000] my_array;

    uint last_index = 0;


    function do_work(bool _delete_array, uint32 num_work, uint32 num_delete) public {
        uint256 x = 0;

        for(uint i=0; i<num_work; i++){
            x = x+1;
        }
        if(_delete_array){
            if(last_index >= num_delete) {
                for(uint j = last_index-num_delete; j<last_index;j++){
                    delete my_array[j];
                }
            }
            last_index = last_index-num_delete;
        }
    }

    function delete_array(uint32 num_delete) external {

    }

    function get_length() external returns(uint256){
        return last_index;
    }

    function input_array() external{

        for(uint i=last_index; i<last_index+50; i++) {
            my_array[i]=1;
        }
        last_index = last_index + 50;
    }

}
