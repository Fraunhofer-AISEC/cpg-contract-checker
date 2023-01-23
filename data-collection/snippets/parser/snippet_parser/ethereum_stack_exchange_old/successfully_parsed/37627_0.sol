pragma solidity ^0.4.0;


contract ArrayDelete {
string[] names;

function main() returns (string[]) {
   names.push("Jones");
   names.push("Ama");
   names.push("Emeka");
   names.push("Owo");
   names.push("Lulu");

   delete names[0];
   return names;
 }
}
