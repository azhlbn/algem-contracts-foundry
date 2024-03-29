//SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

interface IPartnerHandler {
    function calc(address) external view returns (uint256);

    function totalStakedASTR() external view returns (uint256);
}
