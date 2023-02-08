// SPDX-License-Identifier: MIT
pragma solidity ^0.5.3;
import "@openzeppelin/upgrades/contracts/upgradeability/ProxyFactory.sol";

contract StoreFactory is ProxyFactory {
    address public owner;
    address public implementation;

    modifier onlyOwner(){
        require(msg.sender == owner, 'Only the owner can clone a store');
        _;
    }
    constructor(address _implementation) public {
        implementation = _implementation;
        owner = msg.sender;
    }

    function clone() public onlyOwner {
        deployMinimal(implementation, "");
    }
}