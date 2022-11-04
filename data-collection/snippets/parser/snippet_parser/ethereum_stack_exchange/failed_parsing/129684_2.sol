install_solc(version='latest')
# Solidity source code
compiled_sol = compile_source(
    '''
    pragma solidity ^0.8.14;

    contract DigitalTwin {
        function patientinfo() public {}
        struct Patient {
            uint id;
            bool isVerified;
            string location;
            string pain_type;
            string intensity;
            string frequency;
            string pain_symptom;
            string psychosocial_symptom;
            string life;
            string better;
            string worse;
        }
        mapping(uint => Patient) patient;

        function setPatientData(uint _id, string memory _location, string memory _pain_type, string memory _intensity, string memory _frequency, string memory _pain_symptom, string memory _psychosocial_symptom, string memory _life, string memory _better, string memory _worse) public {
            patient[_id].location = _location;
            patient[_id].pain_type = _pain_type;
            patient[_id].intensity = _intensity;
            patient[_id].frequency = _frequency;
            patient[_id].pain_symptom = _pain_symptom;
            patient[_id].psychosocial_symptom = _psychosocial_symptom;
            patient[_id].life = _life;
            patient[_id].better = _better;
            patient[_id].worse = _worse;
        }

        function getLocation(uint _id) view public returns (string memory location) {
            location = patient[_id].location; 
            return location;
        }

        function getType(uint _id) view public returns (string memory pain_type) {
            pain_type = patient[_id].pain_type; 
            return pain_type;
        }

        function getIntensity(uint _id) view public returns (string memory intensity) {
            intensity = patient[_id].intensity; 
            return intensity;
        }

        function getFrequency(uint _id) view public returns (string memory frequency) {
            frequency = patient[_id].frequency; 
            return frequency;
        }

        function getPain(uint _id) view public returns (string memory pain_symptom) {
            pain_symptom = patient[_id].pain_symptom; 
            return pain_symptom;
        }

        function getPsychosocial(uint _id) view public returns (string memory psychosocial_symptom) {
            psychosocial_symptom = patient[_id].psychosocial_symptom; 
            return psychosocial_symptom;
        }

        function getLife(uint _id) view public returns (string memory life) {
            life = patient[_id].life; 
            return life;
        }

        function getBetter(uint _id) view public returns (string memory better) {
            better = patient[_id].better; 
            return better;
        }

        function getWorse(uint _id) view public returns (string memory worse) {
            worse = patient[_id].worse; 
            return worse;
        }

    }
    ''',
    output_values=['abi', 'bin']
)
