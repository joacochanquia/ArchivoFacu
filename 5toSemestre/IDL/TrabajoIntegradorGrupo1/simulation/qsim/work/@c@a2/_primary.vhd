library verilog;
use verilog.vl_types.all;
entity CA2 is
    port(
        V               : out    vl_logic;
        Q               : in     vl_logic_vector(3 downto 0);
        R               : out    vl_logic_vector(3 downto 0)
    );
end CA2;
