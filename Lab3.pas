Program lab3;
uses crt;
type
  TDate = class
    private
    Hour,Min,Sec:integer;
    
    procedure inputAll(Hour,Min,Sec:Integer); //Ввод времени
    public
    
    procedure DateDiff(h1,m1,s1, h2,m2,s2: Integer; var Answer:String[250]); //Разница между двумя показателями времени в одни сутки
    procedure Print(h1,m1,s1:Integer; var Answer:String[250]); //Вывод текущего заданного времени
    procedure DateAdd(h1,m1,s1, h2,m2,s2: Integer; var Answer:String[250]); //Сумма двух временных показателей
    procedure DateDiffDays(day1,h1,m1,s1, day2,h2,m2,s2: Integer; var Answer:String[250]); //Разница между двумя показателями времени в разные дни
    end;

procedure TDate.inputAll(Hour,Min,Sec: Integer);
  begin
    write('Input hour: ');
    readln(hour);
    write('Input min: ');
    readln(min);
    write('Input sec: ');
    readln(sec);
  end;

procedure TDate.Print(h1,m1,s1: Integer; var Answer:String[250]);
  var
    insec,inmin,inhours: Real;
  begin
   inputAll(h1,m1,s1);
   insec := h1*60*60+m1*60+s1;
   inmin := h1*60+m1+s1/60;
   inhours := h1+m1/60+(s1/60)/60;
   Answer := inttostr(h1) + ' hour, ' + inttostr(m1) + ' min, ' + inttostr(s1) + ' sec. (' + floattostr(insec) +
    ') sec, (' + floattostr(inmin) + ') min, (' + floattostr(inhours) + ') hours.';
  end;

procedure TDate.DateDiff(h1,m1,s1, h2,m2,s2: Integer; var Answer:String[250]);
  begin
    inputALL(h1,m1,s1);
    inputALL(h2,m2,s2);
    
    Answer  := inttostr(abs(h1-h2)) + ' hour, ' + inttostr(abs(m1-m2)) + ' min, ' + inttostr(abs(s1-s2))+ ' sec.';
  end;

procedure TDate.DateAdd(h1,m1,s1, h2,m2,s2: Integer; var Answer:String[250]);
  begin
    inputALL(h1,m1,s1);
    inputALL(h2,m2,s2);
    Answer := inttostr(abs(h1+h2))+ ' hour, ' + inttostr(abs(m1+m2))+ ' min, ' + inttostr(abs(s1+s2))+ ' sec.';
  end;

procedure TDate.DateDiffDays(day1,h1,m1,s1, day2,h2,m2,s2: Integer; var Answer:String[250]);
  var
    y,z: integer;
  begin
    y := abs(day1 - day2);
    y := y * 24;
    z := y + abs(h1-h2);
    if z < 24 then
      begin
      Answer :=  
      inttostr(z)+ ' hour, ' + inttostr(abs(m1-m2))+ ' min, ' + inttostr(abs(s1-s2))+ ' sec.';
      end
    else 
      begin
        Answer := 
        inttostr(z div 24) + ' days, ' + inttostr(z mod 24)+ ' hour, ' + inttostr(abs(m1-m2))+ ' min, ' + inttostr(abs(s1-s2))+ ' sec.';
      end;

  end;

var
  Date1: TDate;
  Answer: String[250];
  h1,m1,s1,h2,m2,s2,d1,d2, n: Integer;

begin

  writeln('Menu:');
  writeln('1) Difference between dates (in one day) ');
  writeln('2) Difference between dates (in few days)');
  writeln('3) Sum of dates');
  writeln('4) Print full date');
  readln(n);
  case n of
    1:  begin 
          write('Write 1st date hours: ');
          readln(h1);
          write('Write 1st date minutes: ');
          readln(m1);
          write('Write 1st date seconds: ');
          readln(s1);
          write('Write 2nd date hours: ');
          readln(h2);
          write('Write 2nd date minutes: ');
          readln(m2);
          write('Write 2nd date seconds: ');
          readln(s2);
            clrscr;
          Date1.DateDiff(h1,m1,s1, h2,m2,s2, Answer);
          writeln('Difference is ', Answer); 
          // ↑ Ошибка времени выполнения: Ссылка на объект не указывает на экземпляр объекта.
        end;
    2:  begin
          write('Write 1st date day: ');
          readln(d1);
          write('Write 1st date hours: ');
          readln(h1);
          write('Write 1st date minutes: ');
          readln(m1);
          write('Write 1st date seconds: ');
          readln(s1);
          write('Write 2nd date day: ');
          readln(d2);
          write('Write 2nd date hours: ');
          readln(h2);
          write('Write 2nd date minutes: ');
          readln(m2);
          write('Write 2nd date seconds: ');
          readln(s2);
            clrscr;
          Date1.DateDiffDays(d1,h1,m1,s1, d2,h2,m2,s2, Answer);
          writeln('Difference is ', Answer);
          // ↑ Ошибка времени выполнения: Ссылка на объект не указывает на экземпляр объекта.
        end;
    3:  begin
          write('Write 1st date hours: ');
          readln(h1);
          write('Write 1st date minutes: ');
          readln(m1);
          write('Write 1st date seconds: ');
          readln(s1);
          write('Write 2nd date hours: ');
          readln(h2);
          write('Write 2nd date minutes: ');
          readln(m2);
          write('Write 2nd date seconds: ');
          readln(s2);
            clrscr;
          Date1.DateAdd(h1,m1,s1, h2,m2,s2, Answer);
          writeln('Summ of dates is ', Answer);
          // ↑ Ошибка времени выполнения: Ссылка на объект не указывает на экземпляр объекта.
        end;
    4:  begin
          write('Write 1st date hours: ');
          readln(h1);
          write('Write 1st date minutes: ');
          readln(m1);
          write('Write 1st date seconds: ');
          readln(s1);
            clrscr;
          Date1.Print(h1,m1,s1, Answer);
          writeln('Difference is ', Answer);
          // ↑ Ошибка времени выполнения: Ссылка на объект не указывает на экземпляр объекта.
        end;
  end;


end.
