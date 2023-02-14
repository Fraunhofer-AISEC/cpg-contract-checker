contract Ballot {

    struct Prop {
        uint votes;
        bytes32 data;
        address[] validators;

    }

   mapping (bytes32 => Prop) props;
   function addProp(address [] validators, bytes32 data ) public returns(bytes32) {
       var pHash = keccak256(data);
       var newProp = props[pHash];
       newProp.data = data;
       newProp.validators = validators;

       return(pHash);

   }

   function getProp (bytes32 pHash) public constant returns (uint, bytes32, address[]){
       var newProp = props[pHash];
       return(newProp.votes, newProp.data, newProp.validators);
   }

   function voteTo(bytes32 pHash) public {
        var newProp = props[pHash];
        newProp.votes = newProp.votes+1;

   }
}
