pragma solidity ^0.4.22;

contract Player{
    struct ADN{
        string[] html; 
        uint maxQTY;
        uint created;
    }

ADN[] public bodies;

address public owner;

function addBody(string _html, string _html1, string _html2, string _html3, uint _maxQTY) public{
    require(msg.sender == owner);
    string [] memory images = new string[](4);
    images[0] = _html;
    images[1] = _html1;
    images[2] = _html2;
    images[3] = _html3;
    bodies.push(ADN({
        html: images,
        maxQTY: _maxQTY,
        created: 0
    }));

}

function showHTML(uint id) public view returns (string){
    return bodies[id].html[0];
}

}
