// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Telegin5 {
    function solution5(int256 a, int256 b) external pure returns (int256) {

        (int256 low, int256 high) = a <= b ? (a, b) : (b, a);
        
        int256 avg = (a / 2) + (b / 2);
        if (high >= 0) {
            // (a % 2 != 0) && (b % 2 != 0)
            if (high % 2 != 0) {
                if (low >= 0 || low % 2 == 0) {
                    avg += 1;
                }
            }
        } else {
            if (high % 2 != 0 && low %2 !=0) {
                avg -= 1;
            }
        }
        return avg;
    }
}
