import os
import sys

import pytest
from starkware.starknet.compiler.compile import compile_starknet_files
from starkware.starknet.testing.state import StarknetState
from yul.main import transpile_from_solidity
from yul.starknet_utils import invoke_method

warp_root = os.path.abspath(os.path.join(__file__, "../../.."))
test_dir = __file__


@pytest.mark.asyncio
async def test_calldatacopy():
    cairo_path = f"{warp_root}/warp/cairo-src"

    caller_file = test_dir[:-8] + ".cairo"
    caller_sol_file = test_dir[:-8] + ".sol"
    caller_info = transpile_from_solidity(caller_sol_file, "WARP")
    caller_definition = compile_starknet_files(
        [caller_file], debug_info=True, cairo_path=[cairo_path]
    )

    callee_file = test_dir[:-8] + "_callee.cairo"
    callee_sol_file = test_dir[:-8] + "_callee.sol"
    callee_info = transpile_from_solidity(callee_sol_file, "WARP")
    callee_definition = compile_starknet_files(
        [callee_file], debug_info=True, cairo_path=[cairo_path]
    )

    starknet = await StarknetState.empty()
    caller_address = await starknet.deploy(
        contract_definition=caller_definition, constructor_calldata=[]
    )
    callee_address = await starknet.deploy(
        contract_definition=callee_definition, constructor_calldata=[]
    )

    res = await invoke_method(starknet, caller_info, caller_address, "callMe", callee_address)
    assert res.retdata == [1, 32, 2, 0, 0]

