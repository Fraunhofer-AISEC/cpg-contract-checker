contract viewExample {

    string state;

    

    function viewState() public view returns(string) {
        
        return state;
    }
}
