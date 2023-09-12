<project xmlns="com.autoesl.autopilot.project" name="proj_axi_master" top="example">
    <includePaths/>
    <libraryPaths/>
    <libraryFlag/>
    <Simulation argv="">
        <SimFlow name="csim" ldflags="" mflags="" clean="true" csimMode="0" lastCsimMode="0"/>
    </Simulation>
    <files xmlns="">
        <file name="../../example_test.cpp" sc="0" tb="1" cflags=" -Wno-unknown-pragmas -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="example.cpp" sc="0" tb="false" cflags="-I/home/ubuntu/git/Vitis_Libraries/security/L1/include" csimflags="-I/home/ubuntu/git/Vitis_Libraries/security/L1/include" blackbox="false"/>
        <file name="enc_dec.hpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="solution1" status="active"/>
    </solutions>
</project>

