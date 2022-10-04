contract BDetails {

struct Details {

    bytes32[] DetailsArray;


}
mapping(string => Details) DetailStructs;

 function appendDetails(string id, bytes32 concatt) payable returns(bool success) {

    DetailStructs[id].DetailsArray.push(concatt); 

}

}
