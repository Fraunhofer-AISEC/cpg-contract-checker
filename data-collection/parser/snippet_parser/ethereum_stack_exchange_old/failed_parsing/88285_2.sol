<div class="container">
          <img src="../public/img/blockchain-logo.jpg" width="300px" style="margin-top: -3rem;">
          <h3>Blockchain Based Center-Ganache Network</h3>
          <hr/>
          <br/>
            <div id="content">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Your ID</th>
                      <th scope="col">Your Center</th>
                      <th scope="col">Accepted PPE</th>
                    </tr>
                  </thead>
                  <tbody id="distributionResults">
                  </tbody>
                </table>
            <hr/>
        <form>
            
            <div class="form-group">
                <label for="yourId">Enter your valid id</label>
                <input type = "number" class = "form-control" id="yourId">
                
                <label for="privateKey">Your private key</label>
                <input type="text"  class = "form-control" id="privateKey">
                
                <label for="amount">Enter Amount</label>
                <input class="form-control" id= "amount" type = number placeholder="Not less/ greater than your balance">
              </div>
              
              <a href="#" onclick="withdraw()" class="btn btn-info">withdraw</a>
              
              <hr />
            <p id="accountAddress" class="text-center">Your account: </p>
        </form>
        </div>
       </div>
