pragma solidity >=0.8.6;


interface ReturnDataCallee {
    function returnMe() external returns (bool);
}

contract WARP {
    function callMe(address add) public payable {
        ReturnDataCallee(add).returnMe();
        assembly {
            returndatacopy(0x0, 0x0, 32)
            let a := mload(0x0)
            let b := eq(a, 1)
            if iszero(b) {
                revert(0,0)
            }
        }
    }
}
