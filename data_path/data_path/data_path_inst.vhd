	component data_path is
		port (
			clk_clk                                                            : in  std_logic                     := 'X';             -- clk
			code_storage_enable_interface_enable                               : in  std_logic                     := 'X';             -- enable
			code_storage_write_interface_write_data                            : in  std_logic_vector(11 downto 0) := (others => 'X'); -- write_data
			code_storage_write_interface_is_write                              : in  std_logic                     := 'X';             -- is_write
			code_storage_write_interface_write_line                            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_line
			controller_enable_interface_enable                                 : in  std_logic                     := 'X';             -- enable
			controller_use_z_interface_use_z                                   : out std_logic;                                        -- use_z
			input_storage_is_write_interface_is_write                          : in  std_logic                     := 'X';             -- is_write
			input_storage_write_interface_write_layer_index                    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			input_storage_write_interface_write_row_index                      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			input_storage_write_interface_write_data                           : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			label_storage_is_write_interface_is_write                          : in  std_logic                     := 'X';             -- is_write
			label_storage_write_interface_write_layer_index                    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			label_storage_write_interface_write_row_index                      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			label_storage_write_interface_write_data                           : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			matrix_storage_locator_reset_interface_reset                       : in  std_logic                     := 'X';             -- reset
			reset_reset_n                                                      : in  std_logic                     := 'X';             -- reset_n
			weight_storage_is_update_interface_is_update                       : in  std_logic                     := 'X';             -- is_update
			weight_storage_is_write_interface_is_write                         : in  std_logic                     := 'X';             -- is_write
			weight_storage_update_weight_interface_dc_dw                       : in  std_logic_vector(47 downto 0) := (others => 'X'); -- dc_dw
			weight_storage_update_weight_interface_layer_index                 : in  std_logic_vector(31 downto 0) := (others => 'X'); -- layer_index
			weight_storage_update_weight_interface_row_index                   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- row_index
			weight_storage_write_interface_write_layer_index                   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			weight_storage_write_interface_write_row_index                     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			weight_storage_write_interface_write_data                          : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			decode_to_dense_register_0_out_weight_interface_w_out              : out std_logic_vector(47 downto 0);                    -- w_out
			decode_to_dense_register_0_out_input_interface_x_out               : out std_logic_vector(47 downto 0);                    -- x_out
			decode_to_dense_register_0_out_load_w_interface_load_w_out         : out std_logic;                                        -- load_w_out
			decode_to_dense_register_0_out_forward_interface_act_type_out      : out std_logic_vector(3 downto 0);                     -- act_type_out
			decode_to_dense_register_0_out_forward_interface_cost_type_out     : out std_logic_vector(7 downto 0);                     -- cost_type_out
			decode_to_dense_register_0_out_forward_interface_w_layer_index_out : out std_logic_vector(31 downto 0);                    -- w_layer_index_out
			decode_to_dense_register_0_out_forward_interface_w_row_index_out   : out std_logic_vector(31 downto 0);                    -- w_row_index_out
			decode_to_dense_register_0_out_forward_interface_is_update_out     : out std_logic;                                        -- is_update_out
			decode_to_dense_register_0_out_forward_interface_backprop_cost_out : out std_logic;                                        -- backprop_cost_out
			decode_to_dense_register_0_out_forward_interface_label_out         : out std_logic_vector(47 downto 0);                    -- label_out
			decode_to_dense_register_0_out_dense_type_interface_dense_type_out : out std_logic_vector(3 downto 0)                      -- dense_type_out
		);
	end component data_path;

	u0 : component data_path
		port map (
			clk_clk                                                            => CONNECTED_TO_clk_clk,                                                            --                                                 clk.clk
			code_storage_enable_interface_enable                               => CONNECTED_TO_code_storage_enable_interface_enable,                               --                       code_storage_enable_interface.enable
			code_storage_write_interface_write_data                            => CONNECTED_TO_code_storage_write_interface_write_data,                            --                        code_storage_write_interface.write_data
			code_storage_write_interface_is_write                              => CONNECTED_TO_code_storage_write_interface_is_write,                              --                                                    .is_write
			code_storage_write_interface_write_line                            => CONNECTED_TO_code_storage_write_interface_write_line,                            --                                                    .write_line
			controller_enable_interface_enable                                 => CONNECTED_TO_controller_enable_interface_enable,                                 --                         controller_enable_interface.enable
			controller_use_z_interface_use_z                                   => CONNECTED_TO_controller_use_z_interface_use_z,                                   --                          controller_use_z_interface.use_z
			input_storage_is_write_interface_is_write                          => CONNECTED_TO_input_storage_is_write_interface_is_write,                          --                    input_storage_is_write_interface.is_write
			input_storage_write_interface_write_layer_index                    => CONNECTED_TO_input_storage_write_interface_write_layer_index,                    --                       input_storage_write_interface.write_layer_index
			input_storage_write_interface_write_row_index                      => CONNECTED_TO_input_storage_write_interface_write_row_index,                      --                                                    .write_row_index
			input_storage_write_interface_write_data                           => CONNECTED_TO_input_storage_write_interface_write_data,                           --                                                    .write_data
			label_storage_is_write_interface_is_write                          => CONNECTED_TO_label_storage_is_write_interface_is_write,                          --                    label_storage_is_write_interface.is_write
			label_storage_write_interface_write_layer_index                    => CONNECTED_TO_label_storage_write_interface_write_layer_index,                    --                       label_storage_write_interface.write_layer_index
			label_storage_write_interface_write_row_index                      => CONNECTED_TO_label_storage_write_interface_write_row_index,                      --                                                    .write_row_index
			label_storage_write_interface_write_data                           => CONNECTED_TO_label_storage_write_interface_write_data,                           --                                                    .write_data
			matrix_storage_locator_reset_interface_reset                       => CONNECTED_TO_matrix_storage_locator_reset_interface_reset,                       --              matrix_storage_locator_reset_interface.reset
			reset_reset_n                                                      => CONNECTED_TO_reset_reset_n,                                                      --                                               reset.reset_n
			weight_storage_is_update_interface_is_update                       => CONNECTED_TO_weight_storage_is_update_interface_is_update,                       --                  weight_storage_is_update_interface.is_update
			weight_storage_is_write_interface_is_write                         => CONNECTED_TO_weight_storage_is_write_interface_is_write,                         --                   weight_storage_is_write_interface.is_write
			weight_storage_update_weight_interface_dc_dw                       => CONNECTED_TO_weight_storage_update_weight_interface_dc_dw,                       --              weight_storage_update_weight_interface.dc_dw
			weight_storage_update_weight_interface_layer_index                 => CONNECTED_TO_weight_storage_update_weight_interface_layer_index,                 --                                                    .layer_index
			weight_storage_update_weight_interface_row_index                   => CONNECTED_TO_weight_storage_update_weight_interface_row_index,                   --                                                    .row_index
			weight_storage_write_interface_write_layer_index                   => CONNECTED_TO_weight_storage_write_interface_write_layer_index,                   --                      weight_storage_write_interface.write_layer_index
			weight_storage_write_interface_write_row_index                     => CONNECTED_TO_weight_storage_write_interface_write_row_index,                     --                                                    .write_row_index
			weight_storage_write_interface_write_data                          => CONNECTED_TO_weight_storage_write_interface_write_data,                          --                                                    .write_data
			decode_to_dense_register_0_out_weight_interface_w_out              => CONNECTED_TO_decode_to_dense_register_0_out_weight_interface_w_out,              --     decode_to_dense_register_0_out_weight_interface.w_out
			decode_to_dense_register_0_out_input_interface_x_out               => CONNECTED_TO_decode_to_dense_register_0_out_input_interface_x_out,               --      decode_to_dense_register_0_out_input_interface.x_out
			decode_to_dense_register_0_out_load_w_interface_load_w_out         => CONNECTED_TO_decode_to_dense_register_0_out_load_w_interface_load_w_out,         --     decode_to_dense_register_0_out_load_w_interface.load_w_out
			decode_to_dense_register_0_out_forward_interface_act_type_out      => CONNECTED_TO_decode_to_dense_register_0_out_forward_interface_act_type_out,      --    decode_to_dense_register_0_out_forward_interface.act_type_out
			decode_to_dense_register_0_out_forward_interface_cost_type_out     => CONNECTED_TO_decode_to_dense_register_0_out_forward_interface_cost_type_out,     --                                                    .cost_type_out
			decode_to_dense_register_0_out_forward_interface_w_layer_index_out => CONNECTED_TO_decode_to_dense_register_0_out_forward_interface_w_layer_index_out, --                                                    .w_layer_index_out
			decode_to_dense_register_0_out_forward_interface_w_row_index_out   => CONNECTED_TO_decode_to_dense_register_0_out_forward_interface_w_row_index_out,   --                                                    .w_row_index_out
			decode_to_dense_register_0_out_forward_interface_is_update_out     => CONNECTED_TO_decode_to_dense_register_0_out_forward_interface_is_update_out,     --                                                    .is_update_out
			decode_to_dense_register_0_out_forward_interface_backprop_cost_out => CONNECTED_TO_decode_to_dense_register_0_out_forward_interface_backprop_cost_out, --                                                    .backprop_cost_out
			decode_to_dense_register_0_out_forward_interface_label_out         => CONNECTED_TO_decode_to_dense_register_0_out_forward_interface_label_out,         --                                                    .label_out
			decode_to_dense_register_0_out_dense_type_interface_dense_type_out => CONNECTED_TO_decode_to_dense_register_0_out_dense_type_interface_dense_type_out  -- decode_to_dense_register_0_out_dense_type_interface.dense_type_out
		);

