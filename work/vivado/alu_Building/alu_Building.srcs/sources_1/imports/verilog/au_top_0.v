/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    input usb_rx,
    input [4:0] io_button,
    input [15:0] io_dip,
    output reg usb_tx,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    output reg [23:0] io_led
  );
  
  
  
  reg rst;
  reg [14:0] segValue;
  reg [15:0] outChecker;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_buttons_oneInput;
  wire [1-1:0] M_buttons_zeroInput;
  wire [1-1:0] M_buttons_nextValueInput;
  wire [1-1:0] M_buttons_previousValueInput;
  wire [1-1:0] M_buttons_enterInput;
  reg [5-1:0] M_buttons_io_button;
  button_controller_2 buttons (
    .clk(clk),
    .io_button(M_buttons_io_button),
    .oneInput(M_buttons_oneInput),
    .zeroInput(M_buttons_zeroInput),
    .nextValueInput(M_buttons_nextValueInput),
    .previousValueInput(M_buttons_previousValueInput),
    .enterInput(M_buttons_enterInput)
  );
  wire [2-1:0] M_seven_seg_counter_value;
  counter_3 seven_seg_counter (
    .clk(clk),
    .rst(rst),
    .value(M_seven_seg_counter_value)
  );
  wire [15-1:0] M_system_fsm_segValue;
  wire [6-1:0] M_system_fsm_alufn_signal;
  wire [1-1:0] M_system_fsm_v;
  wire [16-1:0] M_system_fsm_out;
  reg [1-1:0] M_system_fsm_oneInput;
  reg [1-1:0] M_system_fsm_zeroInput;
  reg [1-1:0] M_system_fsm_nextValue;
  reg [1-1:0] M_system_fsm_previousValue;
  reg [1-1:0] M_system_fsm_enterNext;
  reg [16-1:0] M_system_fsm_outChecker;
  input_fsm_4 system_fsm (
    .clk(clk),
    .rst(rst),
    .oneInput(M_system_fsm_oneInput),
    .zeroInput(M_system_fsm_zeroInput),
    .nextValue(M_system_fsm_nextValue),
    .previousValue(M_system_fsm_previousValue),
    .enterNext(M_system_fsm_enterNext),
    .outChecker(M_system_fsm_outChecker),
    .segValue(M_system_fsm_segValue),
    .alufn_signal(M_system_fsm_alufn_signal),
    .v(M_system_fsm_v),
    .out(M_system_fsm_out)
  );
  
  wire [4-1:0] M_digit_out;
  seven_seg_select_digit_5 digit (
    .in(M_seven_seg_counter_value),
    .out(M_digit_out)
  );
  
  wire [8-1:0] M_seven_value_out;
  seven_seg_select_value_6 seven_value (
    .in(M_seven_seg_counter_value),
    .value(segValue),
    .out(M_seven_value_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    M_buttons_io_button = io_button;
    outChecker[8+7-:8] = io_dip[8+7-:8];
    outChecker[0+7-:8] = io_dip[0+7-:8];
    M_system_fsm_oneInput = M_buttons_oneInput;
    M_system_fsm_zeroInput = M_buttons_zeroInput;
    M_system_fsm_nextValue = M_buttons_nextValueInput;
    M_system_fsm_enterNext = M_buttons_enterInput;
    M_system_fsm_previousValue = M_buttons_previousValueInput;
    M_system_fsm_outChecker = outChecker;
    segValue = M_system_fsm_segValue;
    io_led[16+7+0-:1] = M_system_fsm_v;
    io_led[16+0+5-:6] = M_system_fsm_alufn_signal;
    io_led[8+7-:8] = M_system_fsm_out[8+7-:8];
    io_led[0+7-:8] = M_system_fsm_out[0+7-:8];
    io_seg = M_seven_value_out;
    io_sel = M_digit_out;
  end
endmodule
