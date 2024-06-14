library verilog;
use verilog.vl_types.all;
entity DecOp is
    port(
        I               : out    vl_logic;
        OP              : in     vl_logic_vector(3 downto 0);
        OPE             : out    vl_logic_vector(2 downto 0);
        OPI             : out    vl_logic_vector(2 downto 0)
    );
end DecOp;
