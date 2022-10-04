contract ServiceContract {


    constructor (address _storeC, address _quizC, address _signC) {

        StorageContract storeC = StoreContract(_storeC);
        QuizContract quizC = QuizContract(_quizC);
        SignatureContract signC = SignatureContract(_signC);
    }


    function storeData (bytes32 data) public {
        storeC.save(data);
    }

    function getAnswer( bytes32 question) public constant returns (bytes32) {
       return quizC.get(question);
    }

    function sign (bytes32 data) public returns (bytes32) {
        return signC.sign(data);
    }

}
