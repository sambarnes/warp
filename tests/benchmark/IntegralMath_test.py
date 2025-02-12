import os

import pytest
from starkware.starknet.compiler.compile import compile_starknet_files
from starkware.starknet.testing.starknet import Starknet

from tests.logging.generateMarkdown import (
    bytecode_details,
    size_of_file,
    steps_in_function,
)
from tests.utils import CAIRO_PATH, WARP_ROOT
from warp.yul.main import transpile_from_solidity

test_dir = __file__


@pytest.mark.asyncio
async def test_starknet():
    contract_file = test_dir[:-8] + ".cairo"
    sol_file = test_dir[:-8] + ".sol"

    # ======= Handwritten Cairo =======
    contractDef = compile_starknet_files(
        [contract_file], debug_info=True, cairo_path=[CAIRO_PATH]
    )
    bytecode_details("IntegralMath", contractDef.program.data, "IntegralMath")
    size_of_file("IntegralMath", contract_file, "IntegralMath")

    starknet = await Starknet.empty()
    contract = await starknet.deploy(contract_def=contractDef, constructor_calldata=[])

    exec_info = await contract.floorLog2((10, 0)).invoke()
    steps_in_function("IntegralMath", "floorLog2", exec_info, "IntegralMath")
    assert exec_info.result._asdict()["res"] == 3

    exec_info = await contract.floorSqrt((10, 0)).invoke()
    steps_in_function("IntegralMath", "floorSqrt", exec_info, "IntegralMath")
    assert exec_info.result._asdict()["res"] == (3, 0)

    # exec_info = await contract.ceilSqrt((10, 0)).invoke()
    # steps_in_function("IntegralMath", "ceilSqrt", exec_info)
    # assert exec_info.result._asdict()["res"] == (4, 0)

    exec_info = await contract.floorCbrt((10, 0)).invoke()
    steps_in_function("IntegralMath", "floorCbrt", exec_info, "IntegralMath")
    assert exec_info.result._asdict()["res"] == (2, 0)

    exec_info = await contract.ceilCbrt((10, 0)).invoke()
    steps_in_function("IntegralMath", "ceilCbrt", exec_info, "IntegralMath")
    assert exec_info.result._asdict()["res"] == (3, 0)

    # exec_info = await contract.roundDiv((4, 0), (5, 0)).invoke()
    # steps_in_function("IntegralMath", "roundDiv", exec_info)
    # assert exec_info.result._asdict()["res"] == (1, 0)

    # exec_info = await contract.mulDivF((2, 0), (3, 0), (5, 0)).invoke()
    # steps_in_function("IntegralMath", "mulDivF", exec_info)
    # assert exec_info.result._asdict()["res"] == (1, 0)

    # exec_info = await contract.mulDivC((2, 0), (3, 0), (5, 0)).invoke()
    # steps_in_function("IntegralMath", "floorLog2", exec_info)
    # assert exec_info.result._asdict()["res"] == (2, 0)

    # exec_info = await contract.mul512((4, 0), (5, 0)).invoke()
    # steps_in_function("IntegralMath", "floorLog2", exec_info)
    # assert exec_info.result._asdict()["res"] == (20, 0)

    exec_info = await contract.sub512((1, 0), (2, 0), (100, 0)).invoke()
    steps_in_function("IntegralMath", "sub512", exec_info, "IntegralMath")
    assert exec_info.result._asdict()["a"] == (0, 0)
    assert exec_info.result._asdict()["b"] == (
        340282366920938463463374607431768211358,
        340282366920938463463374607431768211455,
    )

    exec_info = await contract.div512((1, 0), (2, 0), (100, 0)).invoke()
    steps_in_function("IntegralMath", "div512", exec_info, "IntegralMath")
    assert exec_info.result._asdict()["res"] == (
        190558125475725539539489780161790198415,
        3402823669209384634633746074317682114,
    )

    exec_info = await contract.inv256((10, 0)).invoke()
    steps_in_function("IntegralMath", "floorLog2", exec_info, "IntegralMath")
    assert exec_info.result._asdict()["res"] == (
        154392981352639047313616789111798275072,
        184428587268969546226628472350316351187,
    )

    # ======= Compiled Cairo =======

    program_info = transpile_from_solidity(sol_file, "IntegralMath")
    program_cairo = os.path.join(WARP_ROOT, "benchmark/tmp", "IntegralMath_warp.cairo")

    with open(program_cairo, "w") as f:
        f.write(program_info["cairo_code"])

    # contractDef = compile_starknet_files(
    #     [program_cairo], debug_info=True, cairo_path=[cairo_path]
    # )

    # starknet = await StarknetState.empty()
    # contract_address = await starknet.deploy(
    #     contract_definition=contractDef,
    #     constructor_calldata=[],
    # )
    # bytecode_details("IntegralMath_warp", contractDef.program.data)
    # size_of_file("IntegralMath_warp", program_cairo)

    # res = await invoke_method(starknet, program_info, contract_address, "floorLog2", 10)
    # steps_in_function("IntegralMath_warp", "floorLog2", res)
    # assert res.retdata == [1, 32, 2, 0, 3]

    # res = await invoke_method(starknet, program_info, contract_address, "floorSqrt", 10)
    # steps_in_function("IntegralMath_warp", "floorSqrt", res)
    # assert res.retdata == [1, 32, 2, 0, 3]

    # res = await invoke_method(starknet, program_info, contract_address, "floorCbrt", 10)
    # steps_in_function("IntegralMath_warp", "floorCbrt", res)
    # assert res.retdata == [1, 32, 2, 0, 3]

    # res = await invoke_method(starknet, program_info, contract_address, "ceilCbrt", 10)
    # steps_in_function("IntegralMath_warp", "ceilCbrt", res)
    # assert res.retdata == [1, 32, 2, 0, 3]

    # res = await invoke_method(starknet, program_info, contract_address, "sub512", 10)
    # steps_in_function("IntegralMath_warp", "sub512", res)
    # assert res.retdata == [1, 32, 2, 0, 3]

    # res = await invoke_method(starknet, program_info, contract_address, "div512", 10)
    # steps_in_function("IntegralMath_warp", "div512", res)
    # assert res.retdata == [1, 32, 2, 0, 3]

    # res = await invoke_method(starknet, program_info, contract_address, "inv256", 10)
    # steps_in_function("IntegralMath_warp", "inv256", res)
    # assert res.retdata == [1, 32, 2, 0, 3]
