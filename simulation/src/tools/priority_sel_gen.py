

PTR_WIDTH = 4
DEPTH = 1 << PTR_WIDTH

def main():

    expr_list = []

    print("module shift_priority_arb (")
    print(f"  input  wire [{DEPTH-1}:0] valid_array_i")
    print(f"  input  wire [{PTR_WIDTH-1}:0] bottom_ptr_i")
    print(f"  output wire [{PTR_WIDTH-1}:0] select_ptr_o")
    print(");")

    print("")

    print(f"  wire [{DEPTH-1}:0] shift_valid_array;")
    print("")

    left_expr = ""
    right_expr = ""

    for i in range(DEPTH):
        if i == 1:
            left_expr = "valid_array[0],"
        elif i > 1:
            left_expr = f"{{valid_array[{i-1}:0],"

        expr_list.append(left_expr)

    for i in range(DEPTH):
        if i == DEPTH:
            right_expr = " {{valid_array[0]}}"
        else:
            right_expr = f" valid_array[{DEPTH-1-i}:0]}}"

        expr_list[i] = expr_list[i] + right_expr


        if (i == 0):
            print(f"  assign shift_valid_array[{DEPTH-1}:0] = {{{{{DEPTH}{{bottom_ptr_i[{PTR_WIDTH-1}:0] == {PTR_WIDTH}'d{i}]}}}} & valid_array_i[{DEPTH-1}:0]")
        else:
            print(f"                                 | {{{{{DEPTH}{{bottom_ptr_i[{PTR_WIDTH-1}:0] == {PTR_WIDTH}'d{i}]}}}} & " + expr_list[i])


    print("")

    for i in range(DEPTH):
        if (i == 0):
            print(f"  assign select_ptr_o[{PTR_WIDTH-1}:0] = shift_valid_array[0] ? bottom_ptr[{PTR_WIDTH-1}:0]")
        else:
            print(f"                           : shift_valid_array[{i}] ? bottom_ptr[{PTR_WIDTH-1}:0] + {DEPTH}'d{i}[{PTR_WIDTH-1}:0]")

    print("endmodule")

if __name__ == "__main__":
    main()