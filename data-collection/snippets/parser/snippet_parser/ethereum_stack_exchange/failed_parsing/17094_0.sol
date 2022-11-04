myContract.insertHash("QmWmyoMoctfbAaiEs2G46gpeUmhqFRDW6KWo64y5r581Vz");

contract Example_bytes {
    bytes[] list;
    function insertHash(bytes ipfsHash) {
       list.push(ipfsHash); 
    }
}

contract Example_string {
    struct hashes{
         string hash;
    }

    hashes[] list;
    function insertHash(string ipfsHash) {
       list.push(hashes{hash: ipfsHash); 
    }
}
