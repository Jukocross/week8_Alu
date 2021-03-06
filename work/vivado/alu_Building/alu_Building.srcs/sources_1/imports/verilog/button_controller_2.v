/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module button_controller_2 (
    input clk,
    input [4:0] io_button,
    output reg oneInput,
    output reg zeroInput,
    output reg nextValueInput,
    output reg previousValueInput,
    output reg enterInput
  );
  
  
  
  wire [1-1:0] M_up_button_out;
  reg [1-1:0] M_up_button_in;
  button_conditioner_7 up_button (
    .clk(clk),
    .in(M_up_button_in),
    .out(M_up_button_out)
  );
  wire [1-1:0] M_up_ed_out;
  reg [1-1:0] M_up_ed_in;
  edge_detector_8 up_ed (
    .clk(clk),
    .in(M_up_ed_in),
    .out(M_up_ed_out)
  );
  wire [1-1:0] M_down_button_out;
  reg [1-1:0] M_down_button_in;
  button_conditioner_7 down_button (
    .clk(clk),
    .in(M_down_button_in),
    .out(M_down_button_out)
  );
  wire [1-1:0] M_down_ed_out;
  reg [1-1:0] M_down_ed_in;
  edge_detector_8 down_ed (
    .clk(clk),
    .in(M_down_ed_in),
    .out(M_down_ed_out)
  );
  wire [1-1:0] M_left_button_out;
  reg [1-1:0] M_left_button_in;
  button_conditioner_7 left_button (
    .clk(clk),
    .in(M_left_button_in),
    .out(M_left_button_out)
  );
  wire [1-1:0] M_left_ed_out;
  reg [1-1:0] M_left_ed_in;
  edge_detector_8 left_ed (
    .clk(clk),
    .in(M_left_ed_in),
    .out(M_left_ed_out)
  );
  wire [1-1:0] M_right_button_out;
  reg [1-1:0] M_right_button_in;
  button_conditioner_7 right_button (
    .clk(clk),
    .in(M_right_button_in),
    .out(M_right_button_out)
  );
  wire [1-1:0] M_right_ed_out;
  reg [1-1:0] M_right_ed_in;
  edge_detector_8 right_ed (
    .clk(clk),
    .in(M_right_ed_in),
    .out(M_right_ed_out)
  );
  wire [1-1:0] M_middle_button_out;
  reg [1-1:0] M_middle_button_in;
  button_conditioner_7 middle_button (
    .clk(clk),
    .in(M_middle_button_in),
    .out(M_middle_button_out)
  );
  wire [1-1:0] M_middle_ed_out;
  reg [1-1:0] M_middle_ed_in;
  edge_detector_8 middle_ed (
    .clk(clk),
    .in(M_middle_ed_in),
    .out(M_middle_ed_out)
  );
  
  always @* begin
    M_up_button_in = io_button[0+0-:1];
    M_up_ed_in = M_up_button_out;
    oneInput = M_up_ed_out;
    M_down_button_in = io_button[2+0-:1];
    M_down_ed_in = M_down_button_out;
    nextValueInput = M_down_ed_out;
    M_left_button_in = io_button[3+0-:1];
    M_left_ed_in = M_left_button_out;
    zeroInput = M_left_ed_out;
    M_right_button_in = io_button[4+0-:1];
    M_right_ed_in = M_right_button_out;
    enterInput = M_right_ed_out;
    M_middle_button_in = io_button[1+0-:1];
    M_middle_ed_in = M_middle_button_out;
    previousValueInput = M_middle_ed_out;
  end
endmodule
