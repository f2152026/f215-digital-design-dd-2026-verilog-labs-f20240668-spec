with open("flat_equations.txt", "w") as f:
    for i in range(1, 65):
        terms = [f"g[{i-1}]"]
        for j in range(i-1, 0, -1):
            p_str = " & ".join([f"p[{k}]" for k in range(i-1, j-1, -1)])
            terms.append(f"({p_str} & g[{j-1}])")
        p_all = " & ".join([f"p[{k}]" for k in range(i-1, -1, -1)])
        terms.append(f"({p_all} & cin)")
        rhs = " | ".join(terms)
        f.write(f"  assign #(2) c[{i}] = {rhs};\n")