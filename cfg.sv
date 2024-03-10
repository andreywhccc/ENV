class base_cfg extends uvm_object;

    `uvm_object_utils(base_cfg)

    svt_axi_system_configuration axi_env_cfg;
    wyh_apb_cfg                  apb_uvc_cfg;

    function new(string name = "base_cfg");
        super.new(name);

        apb_uvc_cfg = wyh_apb_cfg::type_id::create("apb_uvc_cfg");


        axi_env_cfg = svt_axi_system_configuration::type_id::create("axi_env_cfg");
        axi_env_cfg.num_masters = 1;
        axi_env_cfg.num slaves = l;
        axi_env_cfg.create_sub_cfgs(1,1); 
        axi_env_cfg.master_cfg[0].enable_xml_gen = l; 
        axi_env_cfg.slave_cfg[0].enable_xml_gen = l; 

        axi_env_cfg.master_cfg[0].pa_format_type = svt_xml_writer::FSDB; 
        axi_env_cfg.slave_cfg[0].pa_format_type= svt_xml_writer::FSDB; 

        axi_env_cfg.master_cfg[0].transaction_coverage_enable = l; 
        axi_env_cfg.slave_cfg[0].transaction_coverage_enable = l; 

        axi_env_cfg.master_cfg[0].addr_width = 32; 
        axi_env_cfg.slave_cfg[0].addr_width = 32; 

        axi_env_cfg.master_cfg[0].data_width = 64; 
        axi_env_cfg.slave_cfg[0].data_width = 64; 

        axi_env_cfg.master_cfg[0].id_width = 4; 
        axi_env_cfg.slave_cfg[0].id_width = 4; 

        axi_env_cfg.master_cfg[0].reordering_algorithm = svt_axi_port_configuration::RANDOM;
        axi_env_cfg.slave_cfg[0].reordering_algorithm = svt_axi_port_configuration::RANDOM;

        axi_env_cfg.master_cfg[0].write_resp_reordering_depth = `SVT_AXI_MAX_WRITE_RESP_REORDERING_DEPTH:
        axi_env_cfg.slave_cfg[0].write resp reordering depth = `SVT_AXI_MAX_WRITE_RESP_REORDERING_DEPTH; 

        axi_env_cfg.master_cfg[0].axi_interface_type = svt_axi_port_configuration::AXI4; 
        axi_env_cfg.slave_cfg[0].axi_interface_type = svt_axi_port_configuration::AXI4; 

        axi_env_cfg.master_cfg[0].silent_mode = l; 
        axi_env_cfg.slave_cfg[0].silent_mode = l; 

        axi_env_cfg.set_addr_range(0,32'h0,32'hffff_ffff); 
    endfunction: new
endclass: base_cfg