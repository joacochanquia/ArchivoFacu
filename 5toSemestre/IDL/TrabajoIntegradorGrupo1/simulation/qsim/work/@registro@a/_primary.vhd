library verilog;
use verilog.vl_types.all;
entity RegistroA is
    port(
        A               : out    vl_logic_vector(3 downto 0);
        CLK             : in     vl_logic;
        LoadA           : in     vl_logic;
        I               : in     vl_logic;
        AR              : in     vl_logic_vector(3 downto 0);
        Op              : in     vl_logic_vector(2 downto 0);
        AM              : in     vl_logic_vector(3 downto 0);
        E               : out    vl_logic_vector(3 downto 0);
        Fa              : in     vl_logic_vector(3 downto 0)
    );
end RegistroA;
