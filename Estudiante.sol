pragma solidity ^0.8.10;


contract Estudiante{

    //Crear las variables que me pide.
    
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    string[] private materias;
    mapping(string => uint8) private _notas_materias;
    
    //Crear el constructor con las variables que me pide.
    
    constructor(string memory Nombre, string memory Apellido, string memory Curso){
        _nombre = Nombre;
        _apellido = Apellido;
        _curso = Curso;
        _docente = msg.sender;
    }
    
    //Función que devuelve el apellido del alumno.
    
    function apellido() public view returns (string memory){
        return _apellido;
    }
    
    //Función que devuelve el nombre completo.
    
    function nombre_completo() public view  returns (string memory){
        return string(abi.encodePacked(_nombre,' ', _apellido));
    }
    
    //Función que devuelve el curso del alumno.
    
    function curso() public view returns (string memory){
        return _curso;
    }
    
    //Función que permite asignar la nota del alumno en una materia.
    
    function set_nota_materia (uint8 nota, string memory materia_) public{
        require(msg.sender == _docente, "Solo el docente designado puede asignar notas.");
        require(_nota <= 100 && _nota >= 1, "La nota no puede ser 0 o menor);
        _notas_materias[materia_] = nota;
        
        materias.push (materia_);
    }
    
    //Permite al docente ver la nota del alumno en una materia.
    
    function nota_materia(string memory materia) public view returns (uint8){
        return _notas_materias[materia];
    }
    
    //Función que permite ver si el alumno aprobó o no en una materia.
    
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
    
    //Función que permite ver el promedio del alumno en las materias asignadas.
    
    function promedio() public view returns (uint256){
        uint16 total = 0;
        for (uint8 i=0;i<materias.length;i++)
        {
            
            total += _notas_materias[materias[i]];
            
        }
        uint256  _promedio= total/materias.length;
        return _promedio;
    }
    //adress = msg.owner PARA DOCENTE
}
