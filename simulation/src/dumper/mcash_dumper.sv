module mcash_dumper(clk);

  input logic clk;

  string dumper_log;
  integer dumper_fp;

  initial begin
    if(!$value$plusargs("MCASH_DUMP_LOG=%s", dumper_log)) begin
      dumper_log = "mcash_dumper.log";
    end
    $display("mcash dumper log is: %s", dumper_log);
    dumper_fp = $fopen(dumper_log, "w");
  end


  `define CROSS_BAR_CORE mcash_tb.u_mcash_top.u_cross_bar_top.u_cross_bar_core

  always_ff @(posedge clk) begin
    // bank0
    if (`CROSS_BAR_CORE.bank0_channel_grant[0]) begin
      $fdisplay(dumper_fp, "Bank0: channel0 send a request, entry ID: %d", `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank0);
    end
    if (`CROSS_BAR_CORE.bank0_channel_grant[1]) begin
      $fdisplay(dumper_fp, "Bank0: channel1 send a request, entry ID: %d", `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank0);
    end
    if (`CROSS_BAR_CORE.bank0_channel_grant[2]) begin
      $fdisplay(dumper_fp, "Bank0: channel2 send a request, entry ID: %d", `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank0);
    end

    // bank1
    if (`CROSS_BAR_CORE.bank1_channel_grant[0]) begin
      $fdisplay(dumper_fp, "Bank1: channel0 send a request, entry ID: %d", `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank1);
    end
    if (`CROSS_BAR_CORE.bank1_channel_grant[1]) begin
      $fdisplay(dumper_fp, "Bank1: channel1 send a request, entry ID: %d", `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank1);
    end
    if (`CROSS_BAR_CORE.bank1_channel_grant[2]) begin
      $fdisplay(dumper_fp, "Bank1: channel2 send a request, entry ID: %d", `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank1);
    end

    // bank2
    if (`CROSS_BAR_CORE.bank2_channel_grant[0]) begin
      $fdisplay(dumper_fp, "Bank2: channel0 send a request, entry ID: %d",  `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank2);
    end
    if (`CROSS_BAR_CORE.bank2_channel_grant[1]) begin
      $fdisplay(dumper_fp, "Bank2: channel0 send a request, entry ID: %d",  `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank2);
    end
    if (`CROSS_BAR_CORE.bank2_channel_grant[2]) begin
      $fdisplay(dumper_fp, "Bank2: channel0 send a request, entry ID: %d",  `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank2);
    end

    // bank3
    if (`CROSS_BAR_CORE.bank3_channel_grant[0]) begin
      $fdisplay(dumper_fp, "Bank3: channel0 send a request, entry ID: %d",  `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch0.ch_entryID_send_to_bank3);
    end
    if (`CROSS_BAR_CORE.bank3_channel_grant[1]) begin
      $fdisplay(dumper_fp, "Bank3: channel0 send a request, entry ID: %d",  `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch1.ch_entryID_send_to_bank3);
    end
    if (`CROSS_BAR_CORE.bank3_channel_grant[2]) begin
      $fdisplay(dumper_fp, "Bank3: channel0 send a request, entry ID: %d",  `CROSS_BAR_CORE.u_cross_bar_core_buffer_ch2.ch_entryID_send_to_bank3);
    end

  end
endmodule