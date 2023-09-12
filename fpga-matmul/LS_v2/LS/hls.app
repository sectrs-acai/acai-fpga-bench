<project xmlns="com.autoesl.autopilot.project" name="LS" top="ls_chol">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" csimMode="0" lastCsimMode="0" compiler="true"/>
    </Simulation>
    <files xmlns="">
        <file name="../../ls_chol_tb.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="ls_chol.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="ls_chol.cpp" sc="0" tb="false" cflags="-I/opt/Xilinx/Vivado_HLS/2016.4/include/hls/linear_algebra -I/opt/Xilinx/Vivado_HLS/2016.4/include/hls_linear_algebra.h" csimflags="-I/opt/Xilinx/Vivado_HLS/2016.4/include/hls/linear_algebra -I/opt/Xilinx/Vivado_HLS/2016.4/include/hls_linear_algebra.h" blackbox="false"/>
        <file name="ap_lib.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

