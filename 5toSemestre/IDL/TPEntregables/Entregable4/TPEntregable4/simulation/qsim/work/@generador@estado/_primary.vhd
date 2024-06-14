library verilog;
use verilog.vl_types.all;
entity GeneradorEstado is
    port(
        Qm              : out    vl_logic_vector(3 downto 0);
        A               : in     vl_logic;
        B               : in     vl_logic;
        Q               : in     vl_logic_vector(3 downto 0)
    );
end GeneradorEstado;
