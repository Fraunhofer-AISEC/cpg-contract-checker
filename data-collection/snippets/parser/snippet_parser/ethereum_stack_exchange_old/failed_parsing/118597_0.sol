interface IFirst {function someCall(address sender) external;}
interface ISecond {function someCall(address sender) external;}

contract MyContract is IFirst, ISecond {    
    function someCall(address sender) external override {...}
}
