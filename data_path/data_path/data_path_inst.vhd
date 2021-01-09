	component data_path is
		port (
			clk_clk                                              : in  std_logic                     := 'X';             -- clk
			code_storage_enable_interface_enable                 : in  std_logic                     := 'X';             -- enable
			code_storage_write_interface_write_data              : in  std_logic_vector(11 downto 0) := (others => 'X'); -- write_data
			code_storage_write_interface_is_write                : in  std_logic                     := 'X';             -- is_write
			code_storage_write_interface_write_line              : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_line
			controller_enable_interface_enable                   : in  std_logic                     := 'X';             -- enable
			controller_use_z_interface_use_z                     : out std_logic;                                        -- use_z
			input_storage_is_write_interface_is_write            : in  std_logic                     := 'X';             -- is_write
			input_storage_write_interface_write_layer_index      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			input_storage_write_interface_write_row_index        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			input_storage_write_interface_write_data             : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			label_storage_is_write_interface_is_write            : in  std_logic                     := 'X';             -- is_write
			label_storage_write_interface_write_layer_index      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			label_storage_write_interface_write_row_index        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			label_storage_write_interface_write_data             : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			matrix_storage_locator_reset_interface_reset         : in  std_logic                     := 'X';             -- reset
			reset_reset_n                                        : in  std_logic                     := 'X';             -- reset_n
			weight_storage_is_update_interface_is_update         : in  std_logic                     := 'X';             -- is_update
			weight_storage_is_write_interface_is_write           : in  std_logic                     := 'X';             -- is_write
			weight_storage_update_weight_interface_dc_dw         : in  std_logic_vector(47 downto 0) := (others => 'X'); -- dc_dw
			weight_storage_update_weight_interface_layer_index   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- layer_index
			weight_storage_update_weight_interface_row_index     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- row_index
			weight_storage_write_interface_write_layer_index     : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_layer_index
			weight_storage_write_interface_write_row_index       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- write_row_index
			weight_storage_write_interface_write_data            : in  std_logic_vector(47 downto 0) := (others => 'X'); -- write_data
			backpropagator_0_dc_dw_stream_interface_dc_dw_stream : out std_logic_vector(47 downto 0)                     -- dc_dw_stream
		);
	end component data_path;

	u0 : component data_path
		port map (
			clk_clk                                              => CONNECTED_TO_clk_clk,                                              --                                     clk.clk
			code_storage_enable_interface_enable                 => CONNECTED_TO_code_storage_enable_interface_enable,                 --           code_storage_enable_interface.enable
			code_storage_write_interface_write_data              => CONNECTED_TO_code_storage_write_interface_write_data,              --            code_storage_write_interface.write_data
			code_storage_write_interface_is_write                => CONNECTED_TO_code_storage_write_interface_is_write,                --                                        .is_write
			code_storage_write_interface_write_line              => CONNECTED_TO_code_storage_write_interface_write_line,              --                                        .write_line
			controller_enable_interface_enable                   => CONNECTED_TO_controller_enable_interface_enable,                   --             controller_enable_interface.enable
			controller_use_z_interface_use_z                     => CONNECTED_TO_controller_use_z_interface_use_z,                     --              controller_use_z_interface.use_z
			input_storage_is_write_interface_is_write            => CONNECTED_TO_input_storage_is_write_interface_is_write,            --        input_storage_is_write_interface.is_write
			input_storage_write_interface_write_layer_index      => CONNECTED_TO_input_storage_write_interface_write_layer_index,      --           input_storage_write_interface.write_layer_index
			input_storage_write_interface_write_row_index        => CONNECTED_TO_input_storage_write_interface_write_row_index,        --                                        .write_row_index
			input_storage_write_interface_write_data             => CONNECTED_TO_input_storage_write_interface_write_data,             --                                        .write_data
			label_storage_is_write_interface_is_write            => CONNECTED_TO_label_storage_is_write_interface_is_write,            --        label_storage_is_write_interface.is_write
			label_storage_write_interface_write_layer_index      => CONNECTED_TO_label_storage_write_interface_write_layer_index,      --           label_storage_write_interface.write_layer_index
			label_storage_write_interface_write_row_index        => CONNECTED_TO_label_storage_write_interface_write_row_index,        --                                        .write_row_index
			label_storage_write_interface_write_data             => CONNECTED_TO_label_storage_write_interface_write_data,             --                                        .write_data
			matrix_storage_locator_reset_interface_reset         => CONNECTED_TO_matrix_storage_locator_reset_interface_reset,         --  matrix_storage_locator_reset_interface.reset
			reset_reset_n                                        => CONNECTED_TO_reset_reset_n,                                        --                                   reset.reset_n
			weight_storage_is_update_interface_is_update         => CONNECTED_TO_weight_storage_is_update_interface_is_update,         --      weight_storage_is_update_interface.is_update
			weight_storage_is_write_interface_is_write           => CONNECTED_TO_weight_storage_is_write_interface_is_write,           --       weight_storage_is_write_interface.is_write
			weight_storage_update_weight_interface_dc_dw         => CONNECTED_TO_weight_storage_update_weight_interface_dc_dw,         --  weight_storage_update_weight_interface.dc_dw
			weight_storage_update_weight_interface_layer_index   => CONNECTED_TO_weight_storage_update_weight_interface_layer_index,   --                                        .layer_index
			weight_storage_update_weight_interface_row_index     => CONNECTED_TO_weight_storage_update_weight_interface_row_index,     --                                        .row_index
			weight_storage_write_interface_write_layer_index     => CONNECTED_TO_weight_storage_write_interface_write_layer_index,     --          weight_storage_write_interface.write_layer_index
			weight_storage_write_interface_write_row_index       => CONNECTED_TO_weight_storage_write_interface_write_row_index,       --                                        .write_row_index
			weight_storage_write_interface_write_data            => CONNECTED_TO_weight_storage_write_interface_write_data,            --                                        .write_data
			backpropagator_0_dc_dw_stream_interface_dc_dw_stream => CONNECTED_TO_backpropagator_0_dc_dw_stream_interface_dc_dw_stream  -- backpropagator_0_dc_dw_stream_interface.dc_dw_stream
		);

