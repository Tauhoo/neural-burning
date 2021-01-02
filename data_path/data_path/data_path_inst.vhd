	component data_path is
		port (
			clk_clk                                            : in  std_logic                     := 'X';             -- clk
			code_storage_enable_interface_enable               : in  std_logic                     := 'X';             -- enable
			code_storage_write_interface_write_data            : in  std_logic_vector(11 downto 0) := (others => 'X'); -- write_data
			code_storage_write_interface_is_write              : in  std_logic                     := 'X';             -- is_write
			code_storage_write_interface_write_line            : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_line
			controller_enable_interface_enable                 : in  std_logic                     := 'X';             -- enable
			controller_forward_control_interface_is_update     : out std_logic;                                        -- is_update
			controller_forward_control_interface_load_w        : out std_logic;                                        -- load_w
			controller_forward_control_interface_backprop_cost : out std_logic;                                        -- backprop_cost
			controller_use_z_interface_use_z                   : out std_logic;                                        -- use_z
			controller_weigth_interface_w_layer_index          : out std_logic;                                        -- w_layer_index
			controller_weigth_interface_w_row_index            : out std_logic;                                        -- w_row_index
			controller_weigth_interface_is_load                : out std_logic;                                        -- is_load
			input_storage_is_write_interface_is_write          : in  std_logic                     := 'X';             -- is_write
			input_storage_read_data_interface_read_data        : out std_logic_vector(47 downto 0);                    -- read_data
			input_storage_write_interface_write_layer_index    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			input_storage_write_interface_write_row_index      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			input_storage_write_interface_write_data           : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			matrix_storage_locator_reset_interface_reset       : in  std_logic                     := 'X';             -- reset
			parse_0_parameter_type_interface_act_type          : out std_logic_vector(3 downto 0);                     -- act_type
			parse_0_parameter_type_interface_dense_type        : out std_logic_vector(3 downto 0);                     -- dense_type
			parse_0_parameter_type_interface_cost_type         : out std_logic_vector(7 downto 0);                     -- cost_type
			reset_reset_n                                      : in  std_logic                     := 'X';             -- reset_n
			label_storage_write_interface_write_layer_index    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			label_storage_write_interface_write_row_index      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			label_storage_write_interface_write_data           : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			label_storage_read_data_interface_read_data        : out std_logic_vector(47 downto 0);                    -- read_data
			label_storage_is_write_interface_is_write          : in  std_logic                     := 'X'              -- is_write
		);
	end component data_path;

	u0 : component data_path
		port map (
			clk_clk                                            => CONNECTED_TO_clk_clk,                                            --                                    clk.clk
			code_storage_enable_interface_enable               => CONNECTED_TO_code_storage_enable_interface_enable,               --          code_storage_enable_interface.enable
			code_storage_write_interface_write_data            => CONNECTED_TO_code_storage_write_interface_write_data,            --           code_storage_write_interface.write_data
			code_storage_write_interface_is_write              => CONNECTED_TO_code_storage_write_interface_is_write,              --                                       .is_write
			code_storage_write_interface_write_line            => CONNECTED_TO_code_storage_write_interface_write_line,            --                                       .write_line
			controller_enable_interface_enable                 => CONNECTED_TO_controller_enable_interface_enable,                 --            controller_enable_interface.enable
			controller_forward_control_interface_is_update     => CONNECTED_TO_controller_forward_control_interface_is_update,     --   controller_forward_control_interface.is_update
			controller_forward_control_interface_load_w        => CONNECTED_TO_controller_forward_control_interface_load_w,        --                                       .load_w
			controller_forward_control_interface_backprop_cost => CONNECTED_TO_controller_forward_control_interface_backprop_cost, --                                       .backprop_cost
			controller_use_z_interface_use_z                   => CONNECTED_TO_controller_use_z_interface_use_z,                   --             controller_use_z_interface.use_z
			controller_weigth_interface_w_layer_index          => CONNECTED_TO_controller_weigth_interface_w_layer_index,          --            controller_weigth_interface.w_layer_index
			controller_weigth_interface_w_row_index            => CONNECTED_TO_controller_weigth_interface_w_row_index,            --                                       .w_row_index
			controller_weigth_interface_is_load                => CONNECTED_TO_controller_weigth_interface_is_load,                --                                       .is_load
			input_storage_is_write_interface_is_write          => CONNECTED_TO_input_storage_is_write_interface_is_write,          --       input_storage_is_write_interface.is_write
			input_storage_read_data_interface_read_data        => CONNECTED_TO_input_storage_read_data_interface_read_data,        --      input_storage_read_data_interface.read_data
			input_storage_write_interface_write_layer_index    => CONNECTED_TO_input_storage_write_interface_write_layer_index,    --          input_storage_write_interface.write_layer_index
			input_storage_write_interface_write_row_index      => CONNECTED_TO_input_storage_write_interface_write_row_index,      --                                       .write_row_index
			input_storage_write_interface_write_data           => CONNECTED_TO_input_storage_write_interface_write_data,           --                                       .write_data
			matrix_storage_locator_reset_interface_reset       => CONNECTED_TO_matrix_storage_locator_reset_interface_reset,       -- matrix_storage_locator_reset_interface.reset
			parse_0_parameter_type_interface_act_type          => CONNECTED_TO_parse_0_parameter_type_interface_act_type,          --       parse_0_parameter_type_interface.act_type
			parse_0_parameter_type_interface_dense_type        => CONNECTED_TO_parse_0_parameter_type_interface_dense_type,        --                                       .dense_type
			parse_0_parameter_type_interface_cost_type         => CONNECTED_TO_parse_0_parameter_type_interface_cost_type,         --                                       .cost_type
			reset_reset_n                                      => CONNECTED_TO_reset_reset_n,                                      --                                  reset.reset_n
			label_storage_write_interface_write_layer_index    => CONNECTED_TO_label_storage_write_interface_write_layer_index,    --          label_storage_write_interface.write_layer_index
			label_storage_write_interface_write_row_index      => CONNECTED_TO_label_storage_write_interface_write_row_index,      --                                       .write_row_index
			label_storage_write_interface_write_data           => CONNECTED_TO_label_storage_write_interface_write_data,           --                                       .write_data
			label_storage_read_data_interface_read_data        => CONNECTED_TO_label_storage_read_data_interface_read_data,        --      label_storage_read_data_interface.read_data
			label_storage_is_write_interface_is_write          => CONNECTED_TO_label_storage_is_write_interface_is_write           --       label_storage_is_write_interface.is_write
		);

