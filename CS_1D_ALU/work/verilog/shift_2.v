/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shift_2 (
    input [5:0] alufn,
    input [15:0] a,
    input [3:0] b,
    output reg [15:0] c
  );
  
  
  
  reg [15:0] w_shl;
  reg [15:0] x_shl;
  reg [15:0] y_shl;
  reg [15:0] z_shl;
  reg [15:0] w_shr;
  reg [15:0] x_shr;
  reg [15:0] y_shr;
  reg [15:0] z_shr;
  reg [15:0] w_sha;
  reg [15:0] x_sha;
  reg [15:0] y_sha;
  reg [15:0] z_sha;
  
  always @* begin
    w_shl = 16'h0000;
    x_shl = 16'h0000;
    y_shl = 16'h0000;
    z_shl = 16'h0000;
    w_shr = 16'h0000;
    x_shr = 16'h0000;
    y_shr = 16'h0000;
    z_shr = 16'h0000;
    w_sha = 16'h0000;
    x_sha = 16'h0000;
    y_sha = 16'h0000;
    z_sha = 16'h0000;
    c = 16'h0000;
    
    case (b[3+0-:1])
      1'h0: begin
        w_shl = a;
        w_shr = a;
        w_sha = a;
      end
      1'h1: begin
        w_shl = {a[0+7-:8], 8'h00};
        w_shr = {8'h00, a[8+7-:8]};
        w_sha = {{4'h8{a[15+0-:1]}}, a[8+7-:8]};
      end
    endcase
    
    case (b[2+0-:1])
      1'h0: begin
        x_shl = w_shl;
        x_shr = w_shr;
        x_sha = w_sha;
      end
      1'h1: begin
        x_shl = {w_shl[0+11-:12], 4'h0};
        x_shr = {4'h0, w_shr[4+11-:12]};
        x_sha = {{3'h4{a[15+0-:1]}}, w_sha[4+11-:12]};
      end
    endcase
    
    case (b[1+0-:1])
      1'h0: begin
        y_shl = x_shl;
        y_shr = x_shr;
        y_sha = x_sha;
      end
      1'h1: begin
        y_shl = {x_shl[0+13-:14], 2'h0};
        y_shr = {2'h0, x_shr[2+13-:14]};
        y_sha = {{2'h2{a[15+0-:1]}}, x_sha[2+13-:14]};
      end
    endcase
    
    case (b[0+0-:1])
      1'h0: begin
        z_shl = y_shl;
        z_shr = y_shr;
        z_sha = y_sha;
      end
      1'h1: begin
        z_shl = {y_shl[0+14-:15], 1'h0};
        z_shr = {1'h0, y_shr[1+14-:15]};
        z_sha = {a[15+0-:1], y_sha[1+14-:15]};
      end
    endcase
    
    case (alufn[1+0-:1])
      1'h0: begin
        
        case (alufn[0+0-:1])
          1'h0: begin
            c = z_shl;
          end
          1'h1: begin
            c = z_shr;
          end
        endcase
      end
      1'h1: begin
        c = z_sha;
      end
    endcase
  end
endmodule
