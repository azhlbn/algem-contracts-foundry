//SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "../NASTR.sol";
import "./MockERC20.sol";

contract MockKaglaPool {
    NASTR public nastr;
    MockERC20 public kaglaLp;
    
    constructor(
        NASTR _nastr,
        MockERC20 _kaglaLp
    ) {
        nastr = _nastr;
        kaglaLp = _kaglaLp;
    }

    function add_liquidity(uint256[2] calldata amounts, uint256 minToMint) external payable returns (uint256) {
        nastr.transferFrom(msg.sender, address(this), amounts[1]);
        uint256 lpToSend = calc_token_amount(amounts, true);
        kaglaLp.mint(msg.sender, lpToSend);
        return lpToSend;
    }

    function remove_liquidity(uint256 amount, uint256[2] memory minAmounts) external returns (uint256[2] memory) {
        kaglaLp.transferFrom(msg.sender, address(this), amount);

        uint256 totalLpSupply = kaglaLp.totalSupply();
        (uint256 astrInPool, uint256 nastrInPool) = (
            balances(0),
            balances(1)
        );
        uint256 astrAmount = (amount * astrInPool) / totalLpSupply;
        uint256 nastrAmount = (amount * nastrInPool) / totalLpSupply;
        uint256[] memory amounts = new uint256[](2);
        (amounts[0], amounts[1]) = (astrAmount, nastrAmount);
        
        msg.sender.call{value: amounts[0]}("");
        nastr.transfer(msg.sender, amounts[1]);

        kaglaLp.burn(address(this), amount);
    }

    function calc_token_amount(uint256[2] calldata amounts, bool deposit) public view returns (uint256) {
        return amounts[0] + amounts[1];
    }

    function balances(uint256 arg0) public view returns (uint256) {
        require(arg0 == 0 || arg0 == 1, "Should be 0 or 1");
        if (arg0 == 0) return address(this).balance;
        return nastr.balanceOf(address(this));
    }
}