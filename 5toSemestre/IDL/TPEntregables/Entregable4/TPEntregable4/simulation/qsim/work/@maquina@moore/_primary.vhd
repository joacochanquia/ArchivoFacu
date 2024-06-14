library verilog;
use verilog.vl_types.all;
entity MaquinaMoore is
    port(
        L               : out    vl_logic_vector(8 downto 0);
        CLK             : in     vl_logic;
        A               : in     vl_logic;
        B               : in     vl_logic
    );
end MaquinaMoore;
