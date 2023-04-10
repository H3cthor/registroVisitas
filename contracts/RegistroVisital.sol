// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18; 

contract RegistroVisitas {
    
    // Definición de la estructura de datos que almacena la información de la visita
    struct Visita {
        uint256 cantidadVisitas;    // Cantidad de visitas realizadas por el usuario
        uint256 timestamp;      // Marca de tiempo de la operación
    }

    // Declaración del evento que se emite en cada visita
    event NuevaVisita(address indexed usuario, uint256 cantidadVisitas, uint256 indexed timestamp);

    // Mapeo para almacenar las visitas de cada usuario
    mapping(address => Visita) public visitas;

    // Función que se llama cuando el usuario realiza una visita
    function visitar(address usuario) public {
        // Se incrementa la cantidad de visitas realizadas por el usuario
        visitas[usuario].cantidadVisitas++;

        // Se actualiza el timestamp de la última visita del usuario
        visitas[usuario].timestamp = block.timestamp;

        // Se emite el evento de la nueva visita
        emit NuevaVisita(usuario, visitas[usuario].cantidadVisitas, block.timestamp);
    }

    // Función para obtener los datos de visita según la dirección del usuario
    function obtenerVisita(address usuario) public view returns (uint256, uint256) {
        return (visitas[usuario].cantidadVisitas, visitas[usuario].timestamp);
    }
}