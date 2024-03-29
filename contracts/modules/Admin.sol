pragma solidity ^0.5.16;

import "./Ownable.sol";
import "./multiSignatureClient.sol";

contract Admin is multiSignatureClient,Ownable {
    mapping(address => bool) public mapAdmin;
    event AddAdmin(address admin);
    event RemoveAdmin(address admin);

    modifier onlyAdmin() {
        require(mapAdmin[msg.sender], "not admin");
        _;
    }

    function addAdmin(address admin)
        external
        validCall
    {
        mapAdmin[admin] = true;
        emit AddAdmin(admin);
    }

    function removeAdmin(address admin)
        external
        validCall
    {
        delete mapAdmin[admin];
        emit RemoveAdmin(admin);
    }
}