// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;
 
contract Estudiante {
 
   string private _nombre;
   string private _apellido;
   string private _curso;
   address private _docente;
   mapping(string => uint) private notas_materias;
   string[] private materias;
 
   constructor(string memory _nombre2, string memory _apellido2, string memory _curso2){
       _docente = msg.sender;
       _nombre = _nombre2;
       _apellido = _apellido2;
       _curso = _curso2;
   }
  
   function apellido() public view returns(string memory){
       return _apellido;
   }

   function nombre_completo() public view returns(string memory){
       return string.concat(_nombre, " ", _apellido);
   }
  
   function curso() public view returns(string memory){
       return _curso;
   }
  
   function set_nota_materia(uint _nota, string memory _materia) public{
       require(msg.sender == _docente, "solo el docente puede acceder a esta funcion");
       notas_materias[_materia] = _nota;
       materias.push(_materia);
   }
  
   function nota_materia(string memory _materia) public view returns(uint){
       return notas_materias[_materia];
   }
  
   function aprobo(string memory _materia) public view returns(bool){
       if(notas_materias[_materia] >= 6){
           return true;
       }
       else{
           return false;
       }
   }
  
   function promedio() public view returns(uint){
       uint _total;
       for(uint i = 0; i < materias.length; i++){
           _total += notas_materias[materias[i]];
       }
       return _total / materias.length;
   }
}
