-- A DUT entity is used to wrap your design.
--  This example shows how you can do this for the
--  Full-adder.

library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(9 downto 0);
       	output_vector: out std_logic_vector(7 downto 0));
end entity;

architecture DutWrap of DUT is
   component alu_beh is
    generic(
        operand_width : integer:=4;
        sel_line : integer:=2
        );
    port (
        A: in std_logic_vector(operand_width-1 downto 0);
        B: in std_logic_vector(operand_width-1 downto 0);
        sel: in std_logic_vector(sel_line-1 downto 0);
        op: out std_logic_vector((operand_width*2)-1 downto 0)
    ) ;
end component;
begin

   -- input/output vector element ordering is critical,
   -- and must match the ordering in the trace file!
   add_instance: alu_beh 
			port map (
					sel(1) => input_vector(9),
					sel(0) => input_vector(8),
					A(3) => input_vector(7),
					A(2) => input_vector(6),
					A(1) => input_vector(5),
					A(0) => input_vector(4),
					B(3)   => input_vector(3),
					B(2)   => input_vector(2),
					B(1)   => input_vector(1),
					B(0)   => input_vector(0),
					
                                        -- order of outputs S Cout
					op(7) => output_vector(7),
					op(6) => output_vector(6),
					op(5) => output_vector(5),
					op(4) => output_vector(4),
					op(3) => output_vector(3),
					op(2) => output_vector(2),
					op(1) => output_vector(1),
					op(0) => output_vector(0)
					
					);

end DutWrap;

