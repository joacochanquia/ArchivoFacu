library verilog;
use verilog.vl_types.all;
entity GenQ2 is
    port(
        Q2m             : out    vl_logic;
        Q               : in     vl_logic_vector(5 downto 0)
    );
end GenQ2;
