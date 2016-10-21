program iris;
uses crt, math;
type registro = record
                    Sepal_Length : real;
                    Sepal_Width : real;
                    Petal_Length :real;
                    Petal_Width : real;
                    Species : string;
                    end;
var flor : array [1..120] of registro;
     testeo : array [1..30] of registro;
    d1: registro;
    datos : file of registro;
    r : registro;
    i : integer;
    j : integer;
    especies : string;
    c : Integer;
    s : integer;
    ve : integer;
    vi : integer;
    total : Integer;
    x: real;//variables para segunda parte
    y:real;
    bien:real;
    aux1: registro;
    aux2: real;
    dist: array[1..120] of real;
    resultado: string;
const k = 3;
 function distancia(r : registro; x:real; y: real):real;
    begin
     distancia :=sqrt(
                        power(x - r.Petal_Length,2) 
                        + 
                        power((y - r.Petal_Width),2)
                    );
     end;//fin de la funcion distancia
 function res (x:real; y:real):string;
 var i : integer;
 begin
  for i :=1 to 120 do
  begin
  
        dist[i] := distancia(flor[i], x, y);
  end;


for i:= 1 to k do
  for j:= i+1 to 120 do
  begin
    if dist[i] > dist[j] then
      begin
      aux2:= dist[i];
      dist[i]:= dist[j];
      dist[j] := aux2;
     aux1:= flor[i];
     flor[i]:= flor[j];
     flor[j]:= aux1;
     
      end;
      
  end;//final ordenamiento
s:= 0;
ve:= 0;
vi:=0;

  for i:= 1 to k do
  begin
        if flor[i].Species = 'setosa' then
        begin
        s:= s + 1;
        end;

        if flor[i].Species= 'virginica' then
        begin
        vi:= vi + 1;
        end;
        if flor[i].Species= 'versicolor' then
        begin
        ve:= ve + 1;
        end;//final llenar contadores
end;
        if ve > vi then
        begin
                if ve > s then
                        begin
                        res := 'versicolor';
                        end
                else
                        begin
                        res := 'setosa';
                        end
        end
        else
        begin
                if vi > s then
                        begin
                        res := 'virginica';
                        end
                else
                        begin
                        res :='setosa';
                        end
        end;                
        end;///////////////////////final funcion res
begin
c := 1;
s := 1;
ve := 1;
vi := 1;
total := 1;
i := 1;
Assign(datos, 'iris.dat');
Reset(datos);
while not eof(datos) do
  begin
    read(datos, r);
    if (r.species) = 'setosa' then
    begin
        if s <= 10 then 
        begin
             testeo[c] := r;
            c := c+1;
            s := s+1;
        end    
        else
        begin
        
            flor[total] := r;
            total := total+1;
        
        end;//final else
     end;//final if

    end;//final while
/////////////////////////////////////////////////////////
reset(datos);
while not eof(datos) do
begin
    read(datos,r);
    if (r.species) = 'versicolor' then
    begin
        if ve <= 10 then 
        begin
            testeo[c] := r;
            c := c+1;
            ve := ve+1;
        end
        else
        begin
            flor[total] := r;
            total := total+1;
        end;
        
    end;//final if
    
end; //final while

reset(datos);
while not eof(datos) do
begin
    read(datos, r);
    if (r.species) = 'virginica' then
    begin
        if vi <= 10 then 
        begin
                testeo[c] := r;
                c := c+1 ;
                vi := vi+1 ;
        end
        else
        begin
                flor[total] := r;
                total := total+1;
        end;//final else
    end;// final if
    

end;//final del while

    close(datos);
 {
 for i:= 1 to 30 do
 begin
    writeln(i, ' ', testeo[i].Species,' ', testeo[i].Petal_Length,' ', testeo[i].Petal_Width);
 
    readkey();
 end;
 for i:= 1 to 120 do
 begin
    writeln(i, ' ', flor[i].Species,' ', flor[i].Petal_Length,' ', flor[i].Petal_Width);
     readkey();
 end;
 }
///////////////////////////////////////segunda parte/////////////////////////////////////
{for i:= 1 to 30 do
d1 := testeo[i];}

  ////////
  {writeln('escriba x, y');
  readln(x);
  readln(y);////////parte 3///////////////
  resultado:= res(x,y);
      writeln(resultado);}
  
  for i:= 1 to 30 do
    begin
      x := testeo[i].Petal_Length;
      y := testeo[i].Petal_Width;
      
      writeln(i,x,y, testeo[i].Species);
      resultado:= res(x,y);
      writeln(resultado);
      readkey();
      if testeo[i].Species = resultado then
        begin   
          bien := bien+1;
        end;
    end;
writeln('El porcentaje es');
writeln((bien * 100)/30  :3:2);
 Readkey();

end.
