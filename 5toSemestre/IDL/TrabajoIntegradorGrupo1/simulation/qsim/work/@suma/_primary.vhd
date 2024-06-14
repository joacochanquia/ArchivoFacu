library verilog;
use verilog.vl_types.all;
entity Suma is
    port(
        Cout            : out    vl_logic;
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        V               : out    vl_logic;
        R               : out    vl_logic_vector(3 downto 0)
    );
end Suma;
