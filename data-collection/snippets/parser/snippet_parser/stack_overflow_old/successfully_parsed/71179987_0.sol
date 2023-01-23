contract MyContract {
    enum State {waiting, Ready, Active }
    state public state;

    constructor () public {
        state = State.Active; 
    }
function activate () public {
    state = State.Active;
}
function active ()
    public view returns (bool) {
        return state == State.Active;
    }

}  
