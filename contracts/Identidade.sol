pragma solidity >=0.5.0 <0.7.0;

contract SimpleStorage {
	address public owner;

    struct Citizen {
		address citizenID;
        string nome;
        string cpf;
        string cor;
        uint256 dataNascimento;
        string ocupacao;
        string genero;
        string nacionalidade;
	}

	mapping(address => Citizen) public citizens;

    constructor() public {
        owner = msg.sender;
    }

    function setCitizen(string memory nome, string memory cpf, string memory cor, uint256 dataNascimento,
                        string memory ocupacao, string memory genero, string memory nacionalidade) public {

        citizens[msg.sender] = Citizen(msg.sender, nome, cpf, cor, dataNascimento, ocupacao, genero, nacionalidade);
    }

    function checkCPF(address citizenID, string memory cpf) public view returns (bool) {

        if (keccak256(abi.encodePacked(citizens[citizenID].cpf)) == keccak256(abi.encodePacked(cpf))){
            return true;
        }
        return false;
    }

    function checkNome(address citizenID, string memory nome) public view returns (bool) {

        if (keccak256(abi.encodePacked(citizens[citizenID].nome)) == keccak256(abi.encodePacked(nome))){
            return true;
        }
        return false;
    }

    function checkCor(address citizenID, string memory cor) public view returns (bool) {

        if (keccak256(abi.encodePacked(citizens[citizenID].cor)) == keccak256(abi.encodePacked(cor))){
            return true;
        }
        return false;
    }

    function checkAge(address citizenID) public view returns (bool) {

        uint256 idade = (((((now - citizens[citizenID].dataNascimento) / 60) / 60) / 24) / 365);

        if (idade >= 18){
            return true;
        }

        return false;
    }
}