<project xmlns="com.autoesl.autopilot.project" name="svd_enc" top="svd_top1">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim" clean="true" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../svd_tb.cpp" sc="0" tb="1" cflags=" -I../../../../../../git/Vitis_Libraries/security/L1/include -Wno-unknown-pragmas" csimflags=" -I../../../../../../git/Vitis_Libraries/security/L1/include -Wno-unknown-pragmas" blackbox="false"/>
        <file name="svd_enc/svd.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="svd_enc/svd.cpp" sc="0" tb="false" cflags="-I/home/ubuntu/git/Vitis_Libraries/security/L1/include" csimflags="-I/home/ubuntu/git/Vitis_Libraries/security/L1/include" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

