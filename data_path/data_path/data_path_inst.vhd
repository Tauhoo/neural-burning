	component data_path is
		port (
			clk_clk                                                      : in  std_logic                     := 'X';             -- clk
			code_storage_enable_interface_enable                         : in  std_logic                     := 'X';             -- enable
			code_storage_write_interface_write_data                      : in  std_logic_vector(11 downto 0) := (others => 'X'); -- write_data
			code_storage_write_interface_is_write                        : in  std_logic                     := 'X';             -- is_write
			code_storage_write_interface_write_line                      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_line
			controller_enable_interface_enable                           : in  std_logic                     := 'X';             -- enable
			fetch_to_decode_register_code_index_out_interface_code_index : out std_logic_vector(31 downto 0);                    -- code_index
			input_storage_is_write_interface_is_write                    : in  std_logic                     := 'X';             -- is_write
			input_storage_write_interface_write_layer_index              : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			input_storage_write_interface_write_row_index                : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			input_storage_write_interface_write_data                     : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			label_storage_is_write_interface_is_write                    : in  std_logic                     := 'X';             -- is_write
			label_storage_write_interface_write_layer_index              : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			label_storage_write_interface_write_row_index                : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			label_storage_write_interface_write_data                     : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			matrix_storage_locator_reset_interface_reset                 : in  std_logic                     := 'X';             -- reset
			reset_reset_n                                                : in  std_logic                     := 'X';             -- reset_n
			weight_storage_is_write_interface_is_write                   : in  std_logic                     := 'X';             -- is_write
			weight_storage_write_interface_write_layer_index             : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			weight_storage_write_interface_write_row_index               : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			weight_storage_write_interface_write_data                    : in  std_logic_vector(47 downto 0) := (others => 'X')  -- write_data
		);
	end component data_path;

	u0 : component data_path
		port map (
			clk_clk                                                      => CONNECTED_TO_clk_clk,                                                      --                                               clk.clk
			code_storage_enable_interface_enable                         => CONNECTED_TO_code_storage_enable_interface_enable,                         --                     code_storage_enable_interface.enable
			code_storage_write_interface_write_data                      => CONNECTED_TO_code_storage_write_interface_write_data,                      --                      code_storage_write_interface.write_data
			code_storage_write_interface_is_write                        => CONNECTED_TO_code_storage_write_interface_is_write,                        --                                                  .is_write
			code_storage_write_interface_write_line                      => CONNECTED_TO_code_storage_write_interface_write_line,                      --                                                  .write_line
			controller_enable_interface_enable                           => CONNECTED_TO_controller_enable_interface_enable,                           --                       controller_enable_interface.enable
			fetch_to_decode_register_code_index_out_interface_code_index => CONNECTED_TO_fetch_to_decode_register_code_index_out_interface_code_index, -- fetch_to_decode_register_code_index_out_interface.code_index
			input_storage_is_write_interface_is_write                    => CONNECTED_TO_input_storage_is_write_interface_is_write,                    --                  input_storage_is_write_interface.is_write
			input_storage_write_interface_write_layer_index              => CONNECTED_TO_input_storage_write_interface_write_layer_index,              --                     input_storage_write_interface.write_layer_index
			input_storage_write_interface_write_row_index                => CONNECTED_TO_input_storage_write_interface_write_row_index,                --                                                  .write_row_index
			input_storage_write_interface_write_data                     => CONNECTED_TO_input_storage_write_interface_write_data,                     --                                                  .write_data
			label_storage_is_write_interface_is_write                    => CONNECTED_TO_label_storage_is_write_interface_is_write,                    --                  label_storage_is_write_interface.is_write
			label_storage_write_interface_write_layer_index              => CONNECTED_TO_label_storage_write_interface_write_layer_index,              --                     label_storage_write_interface.write_layer_index
			label_storage_write_interface_write_row_index                => CONNECTED_TO_label_storage_write_interface_write_row_index,                --                                                  .write_row_index
			label_storage_write_interface_write_data                     => CONNECTED_TO_label_storage_write_interface_write_data,                     --                                                  .write_data
			matrix_storage_locator_reset_interface_reset                 => CONNECTED_TO_matrix_storage_locator_reset_interface_reset,                 --            matrix_storage_locator_reset_interface.reset
			reset_reset_n                                                => CONNECTED_TO_reset_reset_n,                                                --                                             reset.reset_n
			weight_storage_is_write_interface_is_write                   => CONNECTED_TO_weight_storage_is_write_interface_is_write,                   --                 weight_storage_is_write_interface.is_write
			weight_storage_write_interface_write_layer_index             => CONNECTED_TO_weight_storage_write_interface_write_layer_index,             --                    weight_storage_write_interface.write_layer_index
			weight_storage_write_interface_write_row_index               => CONNECTED_TO_weight_storage_write_interface_write_row_index,               --                                                  .write_row_index
			weight_storage_write_interface_write_data                    => CONNECTED_TO_weight_storage_write_interface_write_data                     --                                                  .write_data
		);

