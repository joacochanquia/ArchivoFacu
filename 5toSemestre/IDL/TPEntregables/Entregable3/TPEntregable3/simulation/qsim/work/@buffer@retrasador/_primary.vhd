library verilog;
use verilog.vl_types.all;
entity BufferRetrasador is
    port(
        S               : out    vl_logic;
        E               : in     vl_logic
    );
end BufferRetrasador;
