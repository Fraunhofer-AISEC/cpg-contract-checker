pragma solidity ^0.4.18;
library Set {
    struct Data {
        mapping (uint=>bool) flags;
    }
    function insert(Data storage self, uint value) returns(bool) {
        if(self.flags[value]){
            return false;
        }else{
            self.flags[value] = true;
            return true;
        }
    }
    function remove(Data storage self, uint value) returns(bool){
        if(!self.flags[value]){
            return true;
        }else{
            self.flags[value] = false;
        }
    }
    function contains(Data storage self, uint value) returns(bool) {
        return self.flags[value];
    }
}
contract useSet {
    using Set for Set.Data;
    Set.Data data;
    function insert(uint value) public returns(bool){
        return data.insert(value);
    }
}
