library verilog;
use verilog.vl_types.all;
entity Flags is
    port(
        Z               : out    vl_logic;
        Q               : in     vl_logic_vector(3 downto 0);
        N               : out    vl_logic
    );
end Flags;
