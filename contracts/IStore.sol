// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.5.3;

interface IStore {
    function value() external view returns (string memory);
    function setValue(string calldata _value) external;
}