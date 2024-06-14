library verilog;
use verilog.vl_types.all;
entity RegistroA_vlg_sample_tst is
    port(
        AM              : in     vl_logic_vector(3 downto 0);
        AR              : in     vl_logic_vector(3 downto 0);
        CLK             : in     vl_logic;
        Fa              : in     vl_logic_vector(3 downto 0);
        I               : in     vl_logic;
        LoadA           : in     vl_logic;
        Op              : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end RegistroA_vlg_sample_tst;
