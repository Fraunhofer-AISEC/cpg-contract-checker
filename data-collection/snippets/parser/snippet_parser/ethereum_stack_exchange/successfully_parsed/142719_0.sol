contract Test{
    uint slot0 = 111;
    uint slot1 = 222;
    function read_slot(uint slot_num) public view returns (uint res) {
        assembly{
            res := sload(slot_num)
        }
    }
}
