module data_types();
        reg a;
        integer b;
        real c;
        time d;
        wire e;
        wand f;
        wor g;
        supply1 h;
        supply0 i;
        tri j;
        tri0 k;
        tri1 l;
        //bufif1 (m);
        //bufif0 (n);
        initial
        $monitor("a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b i=%b j=%b k=%b l=%b Time=%t",a,b,c,d,e,f,g,h,i,j,k,l,$time);
endmodule
