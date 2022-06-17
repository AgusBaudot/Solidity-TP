pragma solidity ^0.8.10;


contract Estudiante{

    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    string[] private materias;
    mapping(string => uint8) private _notas_materias;
    constructor(string memory Nombre, string memory Apellido, string memory Curso){
        _nombre = Nombre;
        _apellido = Apellido;
        _curso = Curso;
        _docente = msg.sender;
    }
    function apellido() public view returns (string memory){
        return _apellido;
    }
    function nombre_completo() public view  returns (string memory){
        return string(abi.encodePacked(_nombre,' ', _apellido));
    }
    function curso() public view returns (string memory){
        return _curso;
    }
    function set_nota_materia (uint8 nota, string memory materia_) public{
        require(msg.sender == _docente, "Solo el docente designado puede asignar notas.");
        _notas_materias[materia_] = nota;
        
        materias.push (materia_);
    }
    function nota_materia(string memory materia) public view returns (uint8){
        return _notas_materias[materia];
    }
    function aprobo (string memory _materia) public view returns (bool){
        if (_notas_materias[_materia]>=60)
        {
            return true;
        }
        else 
        {
            return false;
        }
    }
    function promedio() public view returns (uint256){
        uint16 total = 0;
        for (uint8 i=0;i<materias.length;i++)
        {
            
            total += _notas_materias[materias[i]];
            
        }
        uint256  _promedio= total/materias.length;
        return _promedio;
    }
}
