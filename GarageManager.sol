// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract GarageManager {
    struct Car {
        string make;
        string model;
        string color;
        uint16 numberOfDoors;
    }

    mapping(address => Car[]) public garage;

    function addCar(string memory _make, string memory _model, string memory _color, uint16 _numberOfDoors) public {
        garage[msg.sender].push(Car(
            _make,
            _model,
            _color,
            _numberOfDoors
        ));
    }

    function getMyCars() public view returns (Car[] memory) {
        return garage[msg.sender];
    }

    function getUserCars(address _user) public view returns (Car[] memory) {
        return garage[_user];
    }

    error BadCarIndex(uint);
    function updateCar(uint _index, string memory _make, string memory _model, string memory _color, uint16 _numberOfDoors) public {
        if (_index >= garage[msg.sender].length) {
            revert BadCarIndex(_index);
        }
        garage[msg.sender][_index] = Car(_make, _model, _color, _numberOfDoors);
    }

    function resetMyGarage() public {
        delete garage[msg.sender];
    }
}