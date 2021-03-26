//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.4.22 <0.9.0;
contract ShippingContract {        

    uint256 number = 10;       

    struct Item {
        uint8 id;
        string name;
        uint8 price;
    }
        
    Item[] public items;       

    function setNumber(uint256 _newNumber) external payable {
        require(msg.value == 0.0001 ether, "le montant n'est pas bon");
        number = _newNumber;
    }

        

    function fetchNumber() public view returns (uint256) {
        return number;
    }

        

    }