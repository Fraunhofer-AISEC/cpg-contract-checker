function Manipulate(uint i)
{
     require(msg.sender == data[i].owner, "Sender is not owner.");
     <manipulate object>;
}
