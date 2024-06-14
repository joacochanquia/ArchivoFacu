library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        A               : out    vl_logic_vector(3 downto 0);
        OPCODE          : in     vl_logic_vector(3 downto 0);
        LoadA           : in     vl_logic;
        CLK             : in     vl_logic;
        AM              : in     vl_logic_vector(3 downto 0);
        LoadB           : in     vl_logic;
        BM              : in     vl_logic_vector(3 downto 0);
        B               : out    vl_logic_vector(3 downto 0);
        E               : out    vl_logic_vector(3 downto 0)
    );
end ALU;
