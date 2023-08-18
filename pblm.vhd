
library ieee;
use ieee.std_logic_1164.all;

entity alu_beh is
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
end alu_beh;

architecture a1 of alu_beh is
    function add(A: in std_logic_vector(operand_width-1 downto 0); B: in std_logic_vector(operand_width-1 downto 0))
        return std_logic_vector is
            -- Declare "sum" and "carry" variable
			variable sum,carry: std_logic_vector(4 downto 0);
        begin
            -- write logic for addition
            -- Hint: Use for loop
				
				
				sum(0):=(A(0) xor B(0));
				carry(0):=(A(0) and B(0));
				
				adder: for i in 1 to 3 loop
				sum(i):=(A(i) xor B(i) xor carry(i-1));
				carry(i):=(((A(i) xor B(i)) and carry(i-1)) or (A(i) and B(i)));	
	
                end loop;
					sum(4):= carry(3); 
				
				
				

				
            return sum;
    end add;

 
begin
alu : process( A, B, sel )
variable temp : std_logic_vector(3 downto 0);
begin
   -- complete VHDL code for various outputs of ALU based on select lines
   -- Hint: use if/else statement
   -- add function usage :
   --   signal_name <= add(A,B)
   --   variable_name := add(A,B)
	if (sel="00") then
	  op<= (A&b);
	elsif (sel="01") then
	  op<=("000"&add(A,B));
	elsif (sel="10") then
	  temp:= A xor B;
	  op<=("0000"&temp);
	elsif (sel="11") then 
	 op<=("000"&A&"0");
	end if;
	 
	
	
end process ; -- alu
end a1 ; -- a1
