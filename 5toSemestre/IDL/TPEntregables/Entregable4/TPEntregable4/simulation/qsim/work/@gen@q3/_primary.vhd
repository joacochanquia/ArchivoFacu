library verilog;
use verilog.vl_types.all;
entity GenQ3 is
    port(
        Q3m             : out    vl_logic;
        Q               : in     vl_logic_vector(5 downto 0)
    );
end GenQ3;
