// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";
contract AuditPrecisionLossTest is Test {
    function testPrecisionLossPoC() public {
        uint256 p = 1e10; 
        uint256 s = 1e7;  
        uint256 mult = 1e25; 
        uint256 bugged = ((p * s) / 1e18) * mult / 1e18;
        uint256 correct = (p * s * mult) / (1e18 * 1e18);
        console.log("-----------------------------------------");
        console.log("Bugged Result:", bugged);
        console.log("Correct Result:", correct);
        console.log("-----------------------------------------");
        assertGt(correct, bugged, "Precision loss proven!");
    }
}
