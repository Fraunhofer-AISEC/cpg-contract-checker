<header className="App-header">
  <h1>Ether Coin Flip</h1>
  <h3>Send your ETH to this contract with a 50/50 shot to double it!</h3>
  <button onClick={startCoinFlip}>Start the coin flip!</button>
  <input onChange={e => setWager(e.target.value)} placeholder="Send your ETH"/>
  <br />
        <h2>End a wager</h2>
  <h3>Send ETH to a coin flip that has already begun</h3>
  <p>Make sure to send an equal amount of ETH as the person who started the Coin Flip</p>
  <button onClick={endCoinFlip} >End the coin flip!</button>
  <input  placeholder="End the wager" />
  <input  placeholder="Eth Coin Flip ID" /> 
</header>
