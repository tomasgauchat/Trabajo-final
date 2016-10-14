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
    x: real;
    y:real;
    dist: array[1..120] of real;
const k = 3;
    {setosa : string;
    virginica : String;
    versicolor : String;}
function distancia(x:real; y: real):real;
    begin
     dist[i] := sqrt(power((x-(d1.Petal_Length))2 + (y-(d1.Petal_Width)):2 ));
    end;//fin de la funcion distancia

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
///////////////////////////////////////segunda parte/////////////////////////////////////
for i:= 1 to 30 do
d1 := testeo[i];


for i:= 1 to k do
  for j:= i+1 to 120 do



end.
