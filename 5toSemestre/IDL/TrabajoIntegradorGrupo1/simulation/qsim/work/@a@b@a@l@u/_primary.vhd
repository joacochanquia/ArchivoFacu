library verilog;
use verilog.vl_types.all;
entity ABALU is
    port(
        E               : out    vl_logic_vector(3 downto 0);
        Op              : in     vl_logic_vector(2 downto 0);
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        Fa              : in     vl_logic_vector(3 downto 0);
        R               : out    vl_logic_vector(3 downto 0)
    );
end ABALU;
