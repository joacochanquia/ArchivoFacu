library verilog;
use verilog.vl_types.all;
entity SumaResta is
    port(
        Cout            : out    vl_logic;
        A               : in     vl_logic_vector(3 downto 0);
        Op              : in     vl_logic;
        B               : in     vl_logic_vector(3 downto 0);
        V               : out    vl_logic;
        R               : out    vl_logic_vector(3 downto 0)
    );
end SumaResta;
