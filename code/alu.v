// 32 bit ALU for ARM processor
module alu (input [31:0] a, 
            input[31:0] b, 
            input [2:0] ALUControl,
            output reg [31:0] Result,   // low
            output reg [31:0] Result2,  // high
            output wire [3:0] ALUFlags);
    
    wire negative; 
    wire zero;
    wire carry;
    wire overflow;
    wire [31:0] condinvb;
    wire [32:0] sum;
    assign condinvb = ALUControl[0] ? ~b : b;
    assign sum = a + condinvb + ALUControl;

    always @(*) begin
        casex (ALUControl[2:0]) 
            3'b00?: Result = sum;       // ADD, SUB
            3'b010: Result = a & b;     // AND
            3'b011: Result = a | b;     // OR
            3'b100: Result = a ^ b;     // EOR
            3'b101: Result = a * b;     // MULL
            3'b110: {Result, Result2} = a * b; // UMULL agregamos un registro adicional para el desbordamiento
            3'b111: // SMULL
            case({a[31],b[31]}) //Definimos la logica del SMULL segun
                2'b00: {Result,Result2} = a*b;        //cuando los 2 son positivos y un registro para el desbordamiento
                2'b01: {Result,Result2} =-((a)*-(b)); // cuando la segunda instruccion es negativa y un registro para el desbordamiento
                2'b10: {Result,Result2} =-(-(a)*(b)); //cuando la primera instruccion es negativo y un registro para el desbordamiento
                2'b11: {Result,Result2} = -(a) * -(b);//cuando las 2 instrucciones son negativos y un registro para el desbordamiento
            endcase
        endcase
    end
        

    assign negative = Result[31];
    assign zero = (Result == 32'b0);
    assign carry = (ALUControl[1]==1'b0) & sum[32];
    assign overflow = (ALUControl[1]==1'b0) & ~(a[31] ^ b[31] ^ ALUControl[0]) & (a[31] ^ sum[31]);
    assign ALUFlags = {negative, zero, carry, overflow};
endmodule

