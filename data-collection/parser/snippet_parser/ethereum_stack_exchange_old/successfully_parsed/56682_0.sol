 function addVacancy(address sender, bytes32 vacancyId, uint256 incentive) external  {

        Vacancy vacancy = vacancies[vacancyId];
        vacancy.incentive = incentive;
        vacancy.owner = sender;

        emit NewVacancy(vacancyId, incentive, sender );
    }
