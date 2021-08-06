// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

/**
 * ERC20VotesComp Token Implementation
 *
 * @author Mubashir Rasool Razvi <rizimore@outlook.com>
 */

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20VotesComp.sol";

contract Permit is ERC20VotesComp {
    constructor() ERC20VotesComp("CyberToken", "CT") {
    }
}
