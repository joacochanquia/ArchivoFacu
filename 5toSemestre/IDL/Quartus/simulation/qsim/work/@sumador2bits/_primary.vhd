library verilog;
use verilog.vl_types.all;
entity Sumador2bits is
    port(
        C               : out    vl_logic;
        A               : in     vl_logic_vector(1 downto 0);
        B               : in     vl_logic_vector(1 downto 0);
        Q               : out    vl_logic_vector(1 downto 0)
    );
end Sumador2bits;
