library verilog;
use verilog.vl_types.all;
entity DetPar is
    port(
        impar           : out    vl_logic;
        b               : in     vl_logic_vector(3 downto 0);
        par             : out    vl_logic
    );
end DetPar;
