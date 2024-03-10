class base_env extends uvm_env;

    `uvm_component_utils(base_env)

    base_cfg u_cfg;

    wyh_apb_uvc         apb_uvc;
    svt_axi_system_env  axi_env;

    function new(string name = "base_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction: new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if(!uvm_config_db#(base_cfg)::get(this, "", "cfg", u_cfg)) begin
            `uvm_fatal(get_full_name(), "cfg has not configured")
        end

        uvm_config_db#(wyh_apb_cfg)::set(this, "apb_uvc", "cfg", u_cfg.apb_uvc_cfg);
        apb_uvc = wyh_apb_uvc::type_id::create("apb_uvc", this);

        uvm_config_db#(svt_axi_system_configuration)::set(this, "axi_env", "cfg", u_cfg.axi_env_cfg);
        axi_env = svt_axi_system_env::type_id::create("axi_env", this);
    endfunction: build_phase
endclass: base_env