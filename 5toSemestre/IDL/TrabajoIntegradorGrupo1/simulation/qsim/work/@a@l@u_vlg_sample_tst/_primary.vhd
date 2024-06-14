library verilog;
use verilog.vl_types.all;
entity ALU_vlg_sample_tst is
    port(
        AM              : in     vl_logic_vector(3 downto 0);
        BM              : in     vl_logic_vector(3 downto 0);
        CLK             : in     vl_logic;
        LoadA           : in     vl_logic;
        LoadB           : in     vl_logic;
        OPCODE          : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end ALU_vlg_sample_tst;
