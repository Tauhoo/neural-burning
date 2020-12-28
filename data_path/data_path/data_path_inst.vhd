	component data_path is
		port (
			clk_clk                                                      : in  std_logic                     := 'X';             -- clk
			code_storage_code_control_interface_active                   : in  std_logic                     := 'X';             -- active
			code_storage_code_control_interface_reset                    : in  std_logic                     := 'X';             -- reset
			code_storage_write_interface_write_data                      : in  std_logic_vector(11 downto 0) := (others => 'X'); -- write_data
			code_storage_write_interface_is_write                        : in  std_logic                     := 'X';             -- is_write
			code_storage_write_interface_write_line                      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_line
			fetch_to_decode_register_code_index_out_interface_code_index : out std_logic_vector(31 downto 0);                    -- code_index
			parse_clock_source_clk                                       : out std_logic;                                        -- clk
			parse_op_interface_op                                        : out std_logic_vector(3 downto 0);                     -- op
			parse_parameter_type_interface_act_type                      : out std_logic_vector(3 downto 0);                     -- act_type
			parse_parameter_type_interface_dense_type                    : out std_logic_vector(3 downto 0);                     -- dense_type
			parse_parameter_type_interface_cost_type                     : out std_logic_vector(7 downto 0);                     -- cost_type
			reset_reset_n                                                : in  std_logic                     := 'X'              -- reset_n
		);
	end component data_path;

	u0 : component data_path
		port map (
			clk_clk                                                      => CONNECTED_TO_clk_clk,                                                      --                                               clk.clk
			code_storage_code_control_interface_active                   => CONNECTED_TO_code_storage_code_control_interface_active,                   --               code_storage_code_control_interface.active
			code_storage_code_control_interface_reset                    => CONNECTED_TO_code_storage_code_control_interface_reset,                    --                                                  .reset
			code_storage_write_interface_write_data                      => CONNECTED_TO_code_storage_write_interface_write_data,                      --                      code_storage_write_interface.write_data
			code_storage_write_interface_is_write                        => CONNECTED_TO_code_storage_write_interface_is_write,                        --                                                  .is_write
			code_storage_write_interface_write_line                      => CONNECTED_TO_code_storage_write_interface_write_line,                      --                                                  .write_line
			fetch_to_decode_register_code_index_out_interface_code_index => CONNECTED_TO_fetch_to_decode_register_code_index_out_interface_code_index, -- fetch_to_decode_register_code_index_out_interface.code_index
			parse_clock_source_clk                                       => CONNECTED_TO_parse_clock_source_clk,                                       --                                parse_clock_source.clk
			parse_op_interface_op                                        => CONNECTED_TO_parse_op_interface_op,                                        --                                parse_op_interface.op
			parse_parameter_type_interface_act_type                      => CONNECTED_TO_parse_parameter_type_interface_act_type,                      --                    parse_parameter_type_interface.act_type
			parse_parameter_type_interface_dense_type                    => CONNECTED_TO_parse_parameter_type_interface_dense_type,                    --                                                  .dense_type
			parse_parameter_type_interface_cost_type                     => CONNECTED_TO_parse_parameter_type_interface_cost_type,                     --                                                  .cost_type
			reset_reset_n                                                => CONNECTED_TO_reset_reset_n                                                 --                                             reset.reset_n
		);

