contract ServiceContract {
    constructor (address _storeC, address _quizC, address _signC) {
        StorageContract storeC = StoreContract(_storeC);
        QuizContract quizC = QuizContract(_quizC);
        SignatureContract signC = SignatureContract(_signC);
    }
}
