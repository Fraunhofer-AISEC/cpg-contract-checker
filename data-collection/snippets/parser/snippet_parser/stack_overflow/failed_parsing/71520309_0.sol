pragma solidity >=0.7.0 <0.9.0;

contract CV {
    struct experience {
        address addressCompagnie;
        string nomCompagnie;
        string titrePoste;
        string description;
        bool valide;
    }
    mapping(address => experience ) experiences ; 
    function addExperience(
        address _addressCompagnie,
        string memory _nomCompagnie,
        string memory _titrePoste,
        string memory _description
    ) public { 
        experiences[_addressCompagnie].push(
            experience(
                _addressCompagnie,
                _nomCompagnie,
                _titrePoste,
                _description,
                false
            )
        );
    }
}'''

thanks for helping me ! 
