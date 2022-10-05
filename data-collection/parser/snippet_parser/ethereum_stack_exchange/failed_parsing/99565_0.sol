const ethers = require('ethers');
const provider = new ethers.providers.JsonRpcProvider('https://bsc-dataseed1.binance.org:443');

const contract = new ethers.Contract(address, [
    'function getMultiplier(uint256 _from, uint256 _to) public view returns (uint256)',
], provider);

let works = await contract.getMultiplier(5, 10);
