library verilog;
use verilog.vl_types.all;
entity GeneradorSalidas is
    port(
        L               : out    vl_logic_vector(8 downto 0);
        Q               : in     vl_logic_vector(3 downto 0)
    );
end GeneradorSalidas;
