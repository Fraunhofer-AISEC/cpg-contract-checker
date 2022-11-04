import { useState } from 'react';
import { ethers } from 'ethers';
import OilToken from '../artifacts/contracts/OilToken.sol/OilToken.json'


const Balance = () => {
    const [addr, setAddr] = useState('---');
    const [balance, setBalance] = useState(0);
    let _balance = 0;

    async function getBalanceFromContract() {

        if (typeof window.ethereum !== 'undefined') {
            const [account] = await window.ethereum.request({ method: 'eth_requestAccounts' })
            const provider = new ethers.providers.Web3Provider(window.ethereum);
            const contract = new ethers.Contract(addr, OilToken.abi, provider)
            _balance = contract.s_maxSupply();
        }
    }

    function _setBalance() {
        getBalanceFromContract();
        setBalance(_balance);
    }

    return (
        <div>
            <br />
            <input onChange={e => setAddr(e.target.value)} placeholder="Enter account address" value={addr} />
            <button onClick={_setBalance}>Get Balance</button>
            <br />
            <div>The Max Supply of tokens is: {balance}</div>
        </div>
    );
}

export default Balance
