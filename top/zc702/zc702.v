`timescale 1ns / 1ps
//`default_nettype none

module zc702(
    ////////////////////////////////////////////////////////////
    // Begin External Connections
    ////////////////////////////////////////////////////////////
    // ARM Connections
    inout [53:0] MIO,
    input        PS_SRSTB,
    input        PS_CLK,
    input        PS_PORB,
    inout        DDR_Clk,
    inout        DDR_Clk_n,
    inout        DDR_CKE,
    inout        DDR_CS_n,
    inout        DDR_RAS_n,
    inout        DDR_CAS_n,
    output       DDR_WEB_pin,
    inout [2:0]  DDR_BankAddr,
    inout [14:0] DDR_Addr,
    inout        DDR_ODT,
    inout        DDR_DRSTB,
    inout [31:0] DDR_DQ,
    inout [3:0]  DDR_DM,
    inout [3:0]  DDR_DQS,
    inout [3:0]  DDR_DQS_n,
    inout        DDR_VRP,
    inout        DDR_VRN);
    // END ARM Connections
    ////////////////////////////////////////////////////////////
    // Control connections for FPGA
    //input wire SYSCLK_P;
    //input wire SYSCLK_N;
    //input wire PS_SRST_B;

    ////////////////////////////////////////////////////////////
    //-- connections going into the blackbox stub
    ////////////////////////////////////////////////////////////
    wire [31:0] processing_system7_0_GPIO_I_pin;
    wire [31:0] processing_system7_0_GPIO_O_pin;
    wire processing_system7_0_FCLK_CLK0_pin;
    wire processing_system7_0_FCLK_RESET0_N_pin;
    wire [31:0] axi_ext_slave_conn_0_M_AXI_AWADDR_pin;
    wire axi_ext_slave_conn_0_M_AXI_AWVALID_pin;
    wire axi_ext_slave_conn_0_M_AXI_AWREADY_pin;
    wire [31:0] axi_ext_slave_conn_0_M_AXI_WDATA_pin;
    wire [3:0] axi_ext_slave_conn_0_M_AXI_WSTRB_pin;
    wire axi_ext_slave_conn_0_M_AXI_WVALID_pin;
    wire axi_ext_slave_conn_0_M_AXI_WREADY_pin;
    wire [1:0] axi_ext_slave_conn_0_M_AXI_BRESP_pin;
    wire axi_ext_slave_conn_0_M_AXI_BVALID_pin;
    wire axi_ext_slave_conn_0_M_AXI_BREADY_pin;
    wire [31:0] axi_ext_slave_conn_0_M_AXI_ARADDR_pin;
    wire axi_ext_slave_conn_0_M_AXI_ARVALID_pin;
    wire axi_ext_slave_conn_0_M_AXI_ARREADY_pin;
    wire [31:0] axi_ext_slave_conn_0_M_AXI_RDATA_pin;
    wire [1:0] axi_ext_slave_conn_0_M_AXI_RRESP_pin;
    wire axi_ext_slave_conn_0_M_AXI_RVALID_pin;
    wire axi_ext_slave_conn_0_M_AXI_RREADY_pin;

    // Second external master connector for ACP stuff
    wire [31:0] axi_ext_master_conn_0_S_AXI_AWADDR_pin;
    wire [2:0] axi_ext_master_conn_0_S_AXI_AWPROT_pin;
    wire axi_ext_master_conn_0_S_AXI_AWVALID_pin;
    wire axi_ext_master_conn_0_S_AXI_AWREADY_pin;
    wire [63:0] axi_ext_master_conn_0_S_AXI_WDATA_pin;
    wire [7:0] axi_ext_master_conn_0_S_AXI_WSTRB_pin;
    wire axi_ext_master_conn_0_S_AXI_WVALID_pin;
    wire axi_ext_master_conn_0_S_AXI_WREADY_pin;
    wire [1:0] axi_ext_master_conn_0_S_AXI_BRESP_pin;
    wire axi_ext_master_conn_0_S_AXI_BVALID_pin;
    wire axi_ext_master_conn_0_S_AXI_BREADY_pin;
    wire [31:0] axi_ext_master_conn_0_S_AXI_ARADDR_pin;
    wire [2:0] axi_ext_master_conn_0_S_AXI_ARPROT_pin;
    wire axi_ext_master_conn_0_S_AXI_ARVALID_pin;
    wire axi_ext_master_conn_0_S_AXI_ARREADY_pin;
    wire [63:0] axi_ext_master_conn_0_S_AXI_RDATA_pin;
    wire [1:0] axi_ext_master_conn_0_S_AXI_RRESP_pin;
    wire axi_ext_master_conn_0_S_AXI_RVALID_pin;
    wire axi_ext_master_conn_0_S_AXI_RREADY_pin;
    wire [3:0] axi_ext_master_conn_0_S_AXI_ARCACHE_pin;
    wire [4:0] axi_ext_master_conn_0_S_AXI_ARUSER_pin;
    wire [7:0] axi_ext_master_conn_0_S_AXI_AWLEN_pin;
    wire [2:0] axi_ext_master_conn_0_S_AXI_AWSIZE_pin;
    wire [1:0] axi_ext_master_conn_0_S_AXI_AWBURST_pin;
    wire [3:0] axi_ext_master_conn_0_S_AXI_AWCACHE_pin;
    wire [4:0] axi_ext_master_conn_0_S_AXI_AWUSER_pin;
    wire axi_ext_master_conn_0_S_AXI_WLAST_pin;
    wire [7:0] axi_ext_master_conn_0_S_AXI_ARLEN_pin;
    wire [1:0] axi_ext_master_conn_0_S_AXI_ARBURST_pin;
    wire [2:0] axi_ext_master_conn_0_S_AXI_ARSIZE_pin;
    wire axi_ext_master_conn_0_S_AXI_RLAST_pin;

    wire [15:0] processing_system7_0_IRQ_F2P_pin;

    //------------------------------------------------------------------
    //-- the magic box with AXI interconnects and ARM shit
    //------------------------------------------------------------------
    zc702_ps zc702_ps_instance(
    .processing_system7_0_MIO(MIO),
    .processing_system7_0_PS_SRSTB_pin(PS_SRSTB),
    .processing_system7_0_PS_CLK_pin(PS_CLK),
    .processing_system7_0_PS_PORB_pin(PS_PORB),
    .processing_system7_0_DDR_Clk(DDR_Clk),
    .processing_system7_0_DDR_Clk_n(DDR_Clk_n),
    .processing_system7_0_DDR_CKE(DDR_CKE),
    .processing_system7_0_DDR_CS_n(DDR_CS_n),
    .processing_system7_0_DDR_RAS_n(DDR_RAS_n),
    .processing_system7_0_DDR_CAS_n(DDR_CAS_n),
    .processing_system7_0_DDR_WEB_pin(DDR_WEB_pin),
    .processing_system7_0_DDR_BankAddr(DDR_BankAddr),
    .processing_system7_0_DDR_Addr(DDR_Addr),
    .processing_system7_0_DDR_ODT(DDR_ODT),
    .processing_system7_0_DDR_DRSTB(DDR_DRSTB),
    .processing_system7_0_DDR_DQ(DDR_DQ),
    .processing_system7_0_DDR_DM(DDR_DM),
    .processing_system7_0_DDR_DQS(DDR_DQS),
    .processing_system7_0_DDR_DQS_n(DDR_DQS_n),
    .processing_system7_0_DDR_VRN(DDR_VRN),
    .processing_system7_0_DDR_VRP(DDR_VRP),
    .axi_ext_slave_conn_0_M_AXI_AWADDR_pin(axi_ext_slave_conn_0_M_AXI_AWADDR_pin),
    .axi_ext_slave_conn_0_M_AXI_AWVALID_pin(axi_ext_slave_conn_0_M_AXI_AWVALID_pin),
    .axi_ext_slave_conn_0_M_AXI_AWREADY_pin(axi_ext_slave_conn_0_M_AXI_AWREADY_pin),
    .axi_ext_slave_conn_0_M_AXI_WDATA_pin(axi_ext_slave_conn_0_M_AXI_WDATA_pin),
    .axi_ext_slave_conn_0_M_AXI_WSTRB_pin(axi_ext_slave_conn_0_M_AXI_WSTRB_pin),
    .axi_ext_slave_conn_0_M_AXI_WVALID_pin(axi_ext_slave_conn_0_M_AXI_WVALID_pin),
    .axi_ext_slave_conn_0_M_AXI_WREADY_pin(axi_ext_slave_conn_0_M_AXI_WREADY_pin),
    .axi_ext_slave_conn_0_M_AXI_BRESP_pin(axi_ext_slave_conn_0_M_AXI_BRESP_pin),
    .axi_ext_slave_conn_0_M_AXI_BVALID_pin(axi_ext_slave_conn_0_M_AXI_BVALID_pin),
    .axi_ext_slave_conn_0_M_AXI_BREADY_pin(axi_ext_slave_conn_0_M_AXI_BREADY_pin),
    .axi_ext_slave_conn_0_M_AXI_ARADDR_pin(axi_ext_slave_conn_0_M_AXI_ARADDR_pin),
    .axi_ext_slave_conn_0_M_AXI_ARVALID_pin(axi_ext_slave_conn_0_M_AXI_ARVALID_pin),
    .axi_ext_slave_conn_0_M_AXI_ARREADY_pin(axi_ext_slave_conn_0_M_AXI_ARREADY_pin),
    .axi_ext_slave_conn_0_M_AXI_RDATA_pin(axi_ext_slave_conn_0_M_AXI_RDATA_pin),
    .axi_ext_slave_conn_0_M_AXI_RRESP_pin(axi_ext_slave_conn_0_M_AXI_RRESP_pin),
    .axi_ext_slave_conn_0_M_AXI_RVALID_pin(axi_ext_slave_conn_0_M_AXI_RVALID_pin),
    .axi_ext_slave_conn_0_M_AXI_RREADY_pin(axi_ext_slave_conn_0_M_AXI_RREADY_pin),
    .processing_system7_0_IRQ_F2P_pin(processing_system7_0_IRQ_F2P_pin),
    .processing_system7_0_GPIO_I_pin(processing_system7_0_GPIO_I_pin),
    .processing_system7_0_GPIO_O_pin(processing_system7_0_GPIO_O_pin),
    .processing_system7_0_FCLK_CLK0_pin(processing_system7_0_FCLK_CLK0_pin),
    .processing_system7_0_FCLK_RESET0_N_pin(processing_system7_0_FCLK_RESET0_N_pin),
    .axi_ext_master_conn_0_S_AXI_AWADDR_pin ( axi_ext_master_conn_0_S_AXI_AWADDR_pin ),
    .axi_ext_master_conn_0_S_AXI_AWPROT_pin ( axi_ext_master_conn_0_S_AXI_AWPROT_pin ),
    .axi_ext_master_conn_0_S_AXI_AWVALID_pin ( axi_ext_master_conn_0_S_AXI_AWVALID_pin ),
    .axi_ext_master_conn_0_S_AXI_AWREADY_pin ( axi_ext_master_conn_0_S_AXI_AWREADY_pin ),
    .axi_ext_master_conn_0_S_AXI_WDATA_pin ( axi_ext_master_conn_0_S_AXI_WDATA_pin ),
    .axi_ext_master_conn_0_S_AXI_WSTRB_pin ( axi_ext_master_conn_0_S_AXI_WSTRB_pin ),
    .axi_ext_master_conn_0_S_AXI_WVALID_pin ( axi_ext_master_conn_0_S_AXI_WVALID_pin ),
    .axi_ext_master_conn_0_S_AXI_WREADY_pin ( axi_ext_master_conn_0_S_AXI_WREADY_pin ),
    .axi_ext_master_conn_0_S_AXI_BRESP_pin ( axi_ext_master_conn_0_S_AXI_BRESP_pin ),
    .axi_ext_master_conn_0_S_AXI_BVALID_pin ( axi_ext_master_conn_0_S_AXI_BVALID_pin ),
    .axi_ext_master_conn_0_S_AXI_BREADY_pin ( axi_ext_master_conn_0_S_AXI_BREADY_pin ),
    .axi_ext_master_conn_0_S_AXI_ARADDR_pin ( axi_ext_master_conn_0_S_AXI_ARADDR_pin ),
    .axi_ext_master_conn_0_S_AXI_ARPROT_pin ( axi_ext_master_conn_0_S_AXI_ARPROT_pin ),
    .axi_ext_master_conn_0_S_AXI_ARVALID_pin ( axi_ext_master_conn_0_S_AXI_ARVALID_pin ),
    .axi_ext_master_conn_0_S_AXI_ARREADY_pin ( axi_ext_master_conn_0_S_AXI_ARREADY_pin ),
    .axi_ext_master_conn_0_S_AXI_RDATA_pin ( axi_ext_master_conn_0_S_AXI_RDATA_pin ),
    .axi_ext_master_conn_0_S_AXI_RRESP_pin ( axi_ext_master_conn_0_S_AXI_RRESP_pin ),
    .axi_ext_master_conn_0_S_AXI_RVALID_pin ( axi_ext_master_conn_0_S_AXI_RVALID_pin ),
    .axi_ext_master_conn_0_S_AXI_RREADY_pin ( axi_ext_master_conn_0_S_AXI_RREADY_pin ),
    .axi_ext_master_conn_0_S_AXI_AWLEN_pin ( axi_ext_master_conn_0_S_AXI_AWLEN_pin ),
    .axi_ext_master_conn_0_S_AXI_RLAST_pin ( axi_ext_master_conn_0_S_AXI_RLAST_pin ),
    .axi_ext_master_conn_0_S_AXI_ARCACHE_pin ( axi_ext_master_conn_0_S_AXI_ARCACHE_pin ),
    .axi_ext_master_conn_0_S_AXI_ARUSER_pin ( axi_ext_master_conn_0_S_AXI_ARUSER_pin ),
    .axi_ext_master_conn_0_S_AXI_AWSIZE_pin ( axi_ext_master_conn_0_S_AXI_AWSIZE_pin ),
    .axi_ext_master_conn_0_S_AXI_AWBURST_pin ( axi_ext_master_conn_0_S_AXI_AWBURST_pin ),
    .axi_ext_master_conn_0_S_AXI_AWCACHE_pin ( axi_ext_master_conn_0_S_AXI_AWCACHE_pin ),
    .axi_ext_master_conn_0_S_AXI_AWUSER_pin ( axi_ext_master_conn_0_S_AXI_AWUSER_pin ),
    .axi_ext_master_conn_0_S_AXI_WLAST_pin ( axi_ext_master_conn_0_S_AXI_WLAST_pin ),
    .axi_ext_master_conn_0_S_AXI_ARLEN_pin ( axi_ext_master_conn_0_S_AXI_ARLEN_pin ),
    .axi_ext_master_conn_0_S_AXI_ARBURST_pin ( axi_ext_master_conn_0_S_AXI_ARBURST_pin ),
    .axi_ext_master_conn_0_S_AXI_ARSIZE_pin ( axi_ext_master_conn_0_S_AXI_ARSIZE_pin )
);

endmodule
