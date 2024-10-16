var
   h1,h2:text;
   st:string;
   ch:char;

begin
    assign(h1,'Xoakitu.INP');
    assign(h2,'Xoakitu.OUT');
    reset(h1);
    rewrite(h2);
    readln(h1,st);
    readln(h1,ch);
    repeat
       delete(st,pos(ch,st),1);
    until pos(ch,st) = 0;
    write(h2,st);
    close(h1);
    close(h2);
end.
