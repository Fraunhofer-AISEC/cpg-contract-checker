pragma solidity ^0.4.23;
contract Person {
struct edu {
string title;
string institute;
string date;
string details;
}
edu[] public education;
constructor (string[] title, string[] institute, string[] date, string[] 
details                         
) public {
for (uint i=0; i<title.length; i++)
edu memory newEdu = edu({
title : title[i],
institute : institute[i],
date : date[i],
details : details[i]
});
}
}
