<?xml version="1.0" encoding="UTF-8"?>
<project name="ALU" board="Mojo V3" language="Lucid">
  <files>
    <src>alu.luc</src>
    <src>boolean.luc</src>
    <src>shifter.luc</src>
    <src>instruction_set.luc</src>
    <src>testerFSM.luc</src>
    <src>seven_seg.luc</src>
    <src>adder.luc</src>
    <src>multi_seven_seg.luc</src>
    <src>compare.luc</src>
    <src top="true">mojo_top.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>decoder.luc</component>
    <component>reset_conditioner.luc</component>
    <component>counter.luc</component>
  </files>
</project>
