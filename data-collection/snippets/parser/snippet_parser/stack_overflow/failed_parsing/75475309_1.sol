
import { ethers } from "ethers";

function getEth() 
{
    
    const eth = window.etherium;
    if (!eth) 
    {
        throw new Error("please get Metamask");
    }
    return eth;
}

async function hasAccounts() 
{
    const eth = getEth();
    const accounts = await eth.request({method: "eth_accounts"}) as string[];
    return accounts && accounts.length;
}

async function requestAccounts() 
{
    const eth = getEth();
    const accounts = await eth.request({method: "eth_requestAccounts"}) as string[];
    return accounts && accounts.length;
}

async function run() 
{
    if (!await hasAccounts() && !await requestAccounts())
    {
    throw new Error("Please let me take your money");  
    }
    const counter = new ethers.Contract
    (
        process.env.CONTRACT_ADDRESS,
        [
            "function count() public",
            "function function getCounter() public view returns(uint)",
        ],
        new ethers.providers.Web3Provider(getEth()).getSigner()

    )
    const el = document.createElement("div");
    async function setCounter() 
    {
        el.innerHTML = await counter.getCounter();
    }
    setCounter();
    const button = document.createElement("button");
    button.innerText = "increment";
    button.onclick = async function() 
    {
        await counter.count();
        

        
    }
    document.body.appendChild(el);
    document.body.appendChild(button);
}

run();
