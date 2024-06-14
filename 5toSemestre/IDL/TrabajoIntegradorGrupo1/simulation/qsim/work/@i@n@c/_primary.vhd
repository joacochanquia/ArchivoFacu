library verilog;
use verilog.vl_types.all;
entity INC is
    port(
        Cout            : out    vl_logic;
        Q               : in     vl_logic_vector(3 downto 0);
        V               : out    vl_logic;
        R               : out    vl_logic_vector(3 downto 0)
    );
end INC;
