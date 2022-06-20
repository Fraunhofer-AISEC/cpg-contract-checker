(React code) await this.state.Bid.methods.withDraw(this.state.account).call()
dbank.sol(solidity below code):

function withDraw(address payable receiver)public{
        receiver.transfer(accounts[receiver]);
        accounts[receiver]=0;
     }  
