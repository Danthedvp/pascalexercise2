
var
   h1,h2:text;
   a:array[1..100] of string;
   i,j,max,save:integer;
   str,st:string;

begin
    assign(h1,'KITU.INP');
    assign(h2,'KITU.OUT');
    reset(h1);
    rewrite(h2);

    str:= '';
    while not eof(h1) do
    begin
        read(h1,st);
        str:= str + st + ' ';
    end;

    if(str[1] = ' ') then delete(str,1,1);
    while(pos('  ',str) <> 0) do delete(str,pos('  ',str),1);

    max:= 0;
    save:= 0;
    j:= 1;
    for i:= 1 to length(str) do
    begin
        if(str[i] <> ' ') then a[j]:= a[j] + str[i]
        else
        begin
            if max <= length(a[j]) then begin max:= length(a[j]); save:= j end;
            INC(j);
        end;
    end;
    write(h2,a[save]);
    close(h1);
    close(h2);
end.

