transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/ACADAMICS/EE214/week8/lab/v_jtag.vhd}
vcom -93 -work work {D:/ACADAMICS/EE214/week8/lab/v_jtag.vhd}
vcom -93 -work work {D:/ACADAMICS/EE214/week8/lab/TopLevel.vhdl}
vcom -93 -work work {D:/ACADAMICS/EE214/week8/lab/pblm.vhd}
vcom -93 -work work {D:/ACADAMICS/EE214/week8/lab/DUT.vhdl}

vcom -93 -work work {D:/ACADAMICS/EE214/week8/lab/Testbench.vhdl}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L maxv -L rtl_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
