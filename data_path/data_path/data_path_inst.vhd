	component data_path is
		port (
			clk_clk                                                       : in  std_logic                     := 'X';             -- clk
			code_storage_enable_interface_enable                          : in  std_logic                     := 'X';             -- enable
			code_storage_write_interface_write_data                       : in  std_logic_vector(11 downto 0) := (others => 'X'); -- write_data
			code_storage_write_interface_is_write                         : in  std_logic                     := 'X';             -- is_write
			code_storage_write_interface_write_line                       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_line
			controller_enable_interface_enable                            : in  std_logic                     := 'X';             -- enable
			controller_use_z_interface_use_z                              : out std_logic;                                        -- use_z
			input_storage_is_write_interface_is_write                     : in  std_logic                     := 'X';             -- is_write
			input_storage_write_interface_write_layer_index               : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			input_storage_write_interface_write_row_index                 : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			input_storage_write_interface_write_data                      : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			label_storage_is_write_interface_is_write                     : in  std_logic                     := 'X';             -- is_write
			label_storage_write_interface_write_layer_index               : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			label_storage_write_interface_write_row_index                 : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			label_storage_write_interface_write_data                      : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			matrix_storage_locator_reset_interface_reset                  : in  std_logic                     := 'X';             -- reset
			reset_reset_n                                                 : in  std_logic                     := 'X';             -- reset_n
			weight_storage_is_update_interface_is_update                  : in  std_logic                     := 'X';             -- is_update
			weight_storage_is_write_interface_is_write                    : in  std_logic                     := 'X';             -- is_write
			weight_storage_update_weight_interface_dc_dw                  : in  std_logic_vector(47 downto 0) := (others => 'X'); -- dc_dw
			weight_storage_update_weight_interface_layer_index            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- layer_index
			weight_storage_update_weight_interface_row_index              : in  std_logic_vector(31 downto 0) := (others => 'X'); -- row_index
			weight_storage_write_interface_write_layer_index              : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			weight_storage_write_interface_write_row_index                : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			weight_storage_write_interface_write_data                     : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			activate_to_diff_register_out_forward_interface_label         : out std_logic_vector(47 downto 0);                    -- label
			activate_to_diff_register_out_forward_interface_dense_type    : out std_logic_vector(3 downto 0);                     -- dense_type
			activate_to_diff_register_out_forward_interface_backprop_cost : out std_logic;                                        -- backprop_cost
			activate_to_diff_register_out_forward_interface_w_row_index   : out std_logic_vector(31 downto 0);                    -- w_row_index
			activate_to_diff_register_out_forward_interface_is_update     : out std_logic;                                        -- is_update
			activate_to_diff_register_out_forward_interface_w_layer_index : out std_logic_vector(31 downto 0);                    -- w_layer_index
			activate_to_diff_register_out_cost_type_interface_cost_type   : out std_logic_vector(7 downto 0);                     -- cost_type
			activate_to_diff_register_out_z_interface_z                   : out std_logic_vector(47 downto 0);                    -- z
			activate_to_diff_register_out_x_interface_x                   : out std_logic_vector(47 downto 0);                    -- x
			activate_to_diff_register_out_w_interface_w                   : out std_logic_vector(47 downto 0);                    -- w
			activate_to_diff_register_clock_clk                           : in  std_logic                     := 'X'              -- clk
		);
	end component data_path;

	u0 : component data_path
		port map (
			clk_clk                                                       => CONNECTED_TO_clk_clk,                                                       --                                               clk.clk
			code_storage_enable_interface_enable                          => CONNECTED_TO_code_storage_enable_interface_enable,                          --                     code_storage_enable_interface.enable
			code_storage_write_interface_write_data                       => CONNECTED_TO_code_storage_write_interface_write_data,                       --                      code_storage_write_interface.write_data
			code_storage_write_interface_is_write                         => CONNECTED_TO_code_storage_write_interface_is_write,                         --                                                  .is_write
			code_storage_write_interface_write_line                       => CONNECTED_TO_code_storage_write_interface_write_line,                       --                                                  .write_line
			controller_enable_interface_enable                            => CONNECTED_TO_controller_enable_interface_enable,                            --                       controller_enable_interface.enable
			controller_use_z_interface_use_z                              => CONNECTED_TO_controller_use_z_interface_use_z,                              --                        controller_use_z_interface.use_z
			input_storage_is_write_interface_is_write                     => CONNECTED_TO_input_storage_is_write_interface_is_write,                     --                  input_storage_is_write_interface.is_write
			input_storage_write_interface_write_layer_index               => CONNECTED_TO_input_storage_write_interface_write_layer_index,               --                     input_storage_write_interface.write_layer_index
			input_storage_write_interface_write_row_index                 => CONNECTED_TO_input_storage_write_interface_write_row_index,                 --                                                  .write_row_index
			input_storage_write_interface_write_data                      => CONNECTED_TO_input_storage_write_interface_write_data,                      --                                                  .write_data
			label_storage_is_write_interface_is_write                     => CONNECTED_TO_label_storage_is_write_interface_is_write,                     --                  label_storage_is_write_interface.is_write
			label_storage_write_interface_write_layer_index               => CONNECTED_TO_label_storage_write_interface_write_layer_index,               --                     label_storage_write_interface.write_layer_index
			label_storage_write_interface_write_row_index                 => CONNECTED_TO_label_storage_write_interface_write_row_index,                 --                                                  .write_row_index
			label_storage_write_interface_write_data                      => CONNECTED_TO_label_storage_write_interface_write_data,                      --                                                  .write_data
			matrix_storage_locator_reset_interface_reset                  => CONNECTED_TO_matrix_storage_locator_reset_interface_reset,                  --            matrix_storage_locator_reset_interface.reset
			reset_reset_n                                                 => CONNECTED_TO_reset_reset_n,                                                 --                                             reset.reset_n
			weight_storage_is_update_interface_is_update                  => CONNECTED_TO_weight_storage_is_update_interface_is_update,                  --                weight_storage_is_update_interface.is_update
			weight_storage_is_write_interface_is_write                    => CONNECTED_TO_weight_storage_is_write_interface_is_write,                    --                 weight_storage_is_write_interface.is_write
			weight_storage_update_weight_interface_dc_dw                  => CONNECTED_TO_weight_storage_update_weight_interface_dc_dw,                  --            weight_storage_update_weight_interface.dc_dw
			weight_storage_update_weight_interface_layer_index            => CONNECTED_TO_weight_storage_update_weight_interface_layer_index,            --                                                  .layer_index
			weight_storage_update_weight_interface_row_index              => CONNECTED_TO_weight_storage_update_weight_interface_row_index,              --                                                  .row_index
			weight_storage_write_interface_write_layer_index              => CONNECTED_TO_weight_storage_write_interface_write_layer_index,              --                    weight_storage_write_interface.write_layer_index
			weight_storage_write_interface_write_row_index                => CONNECTED_TO_weight_storage_write_interface_write_row_index,                --                                                  .write_row_index
			weight_storage_write_interface_write_data                     => CONNECTED_TO_weight_storage_write_interface_write_data,                     --                                                  .write_data
			activate_to_diff_register_out_forward_interface_label         => CONNECTED_TO_activate_to_diff_register_out_forward_interface_label,         --   activate_to_diff_register_out_forward_interface.label
			activate_to_diff_register_out_forward_interface_dense_type    => CONNECTED_TO_activate_to_diff_register_out_forward_interface_dense_type,    --                                                  .dense_type
			activate_to_diff_register_out_forward_interface_backprop_cost => CONNECTED_TO_activate_to_diff_register_out_forward_interface_backprop_cost, --                                                  .backprop_cost
			activate_to_diff_register_out_forward_interface_w_row_index   => CONNECTED_TO_activate_to_diff_register_out_forward_interface_w_row_index,   --                                                  .w_row_index
			activate_to_diff_register_out_forward_interface_is_update     => CONNECTED_TO_activate_to_diff_register_out_forward_interface_is_update,     --                                                  .is_update
			activate_to_diff_register_out_forward_interface_w_layer_index => CONNECTED_TO_activate_to_diff_register_out_forward_interface_w_layer_index, --                                                  .w_layer_index
			activate_to_diff_register_out_cost_type_interface_cost_type   => CONNECTED_TO_activate_to_diff_register_out_cost_type_interface_cost_type,   -- activate_to_diff_register_out_cost_type_interface.cost_type
			activate_to_diff_register_out_z_interface_z                   => CONNECTED_TO_activate_to_diff_register_out_z_interface_z,                   --         activate_to_diff_register_out_z_interface.z
			activate_to_diff_register_out_x_interface_x                   => CONNECTED_TO_activate_to_diff_register_out_x_interface_x,                   --         activate_to_diff_register_out_x_interface.x
			activate_to_diff_register_out_w_interface_w                   => CONNECTED_TO_activate_to_diff_register_out_w_interface_w,                   --         activate_to_diff_register_out_w_interface.w
			activate_to_diff_register_clock_clk                           => CONNECTED_TO_activate_to_diff_register_clock_clk                            --                   activate_to_diff_register_clock.clk
		);

