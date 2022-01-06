pragma solidity ^0.8.6;
contract WARP {
    function f() public returns (uint256 a) {
        bytes memory x = hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff";
        assembly {
            a := byte(x, 31)
        }
    }

    function g() public returns (uint256 a) {
        uint x = 2;
        assembly {
            a := byte(x, 31)
        }
    }
}
