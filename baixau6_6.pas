var
   h1,h2:text;
   st1,st2,st3,sum:string;
   bonho,i,n:integer;

begin
    assign(h1,'CONG.INP');
    assign(h2,'CONG.OUT');
    reset(h1);
    rewrite(h2);

    readln(h1,st1);
    readln(h1,st2);
    st3:= '';
    sum:= '';
    bonho:= 0;

    if(length(st1) > length(st2)) then begin
        n:= length(st1);
        for i:= 1 to length(st1) - length(st2) do
            st3:= st3 + '0';
        st3:= st3 + st2;
        st2:= st3;
    end else begin
        n:= length(st2);
        for i:= 1 to length(st2) - length(st1) do
            st3:= st3 + '0';
        st3:= st3 + st1;
        st1:= st3;
    end;

    for i:= 1 to n do
    begin
        sum:= sum + CHR(48 + ((ORD(st1[n - i + 1]) + ORD(st2[n - i + 1]) - 96 + bonho) MOD 10));
        bonho := (ORD(st2[n - i + 1]) + ORD(st1[n - i + 1]) - 96 + bonho) DIV 10;
    end;
    if bonho > 0 then sum:= sum + CHR(bonho + 48);
    for i:= length(sum) downto 1 do
    begin
        write(h2,sum[i]);
    end;
    close(h1);
    close(h2);
end.