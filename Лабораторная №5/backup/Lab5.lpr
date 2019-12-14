program Lab5;

{$mode objfpc}{$H+}
{$interfaces corba}
 //Реализация лабораторной работы будет применена для
 //сборки мобильных телефонов
type
  //----------------------------------------------------------------------------
  //инкапсуляция сенсорного экрана
  TouchScreenBehavior = interface
    procedure touch();
  end;

  WithTouch = class(TouchScreenBehavior) //телефон с сенсорным экраном
    procedure touch();
  end;

  NoTouch = class(TouchScreenBehavior) //телефон без сенсорного экрана
    procedure touch();
  end;

  //----------------------------------------------------------------------------
  //инкапсуляция снимка
  CameraBehavior = interface
    procedure photo();
  end;

  OneCamera = class(CameraBehavior)
    procedure photo(); //телефон с камерой
  end;

  TripleCamera = class(CameraBehavior)
    procedure photo(); //телефон с тройной камерой
  end;

  NoCamera = class(CameraBehavior)
    procedure photo(); //телефон без камеры
  end;

  //----------------------------------------------------------------------------
  // клиент использует инкапсулированные алгоритмы
  Phone = class
    private
      _cameraBehavior: CameraBehavior;
      _touchScreenBehavior: TouchScreenBehavior;

    public
      procedure enable();   //все телефоны включаются
      procedure display; virtual; abstract; //подтипы отображаются по-разному

      procedure performScreen();   //отображение информации с экрана
      procedure takePhoto(); //фотография
  end;

  IPhone = class(Phone)
    constructor Create();
    procedure display; override; // конкретная реализация для IPhone
  end;

  Nokia = class(Phone)
    constructor Create();
    procedure display; override; // конкретная реализация для Nokia
  end;

  Samsung = class(Phone)
    constructor Create();
    procedure display; override; // конкретная реализация для Sumsung
  end;

//------------------------------------------------------------------------------
procedure WithTouch.touch();
begin
  writeln('Phone have a touch screen!');
end;

procedure NoTouch.touch();
begin
  writeln('Phone have a default screen.');
end;

//------------------------------------------------------------------------------
procedure OneCamera.photo(); //делает обычное фото!
begin
   writeln('You are looking at a regular photo!');
end;

procedure TripleCamera.photo(); //делает фото на тройную камеру
begin
   writeln('You are looking at a large format photo in an extra large extension!!!');
end;

procedure NoCamera.photo(); //не делает фото
begin
end;

//------------------------------------------------------------------------------
procedure Phone.performScreen();
begin
  _touchScreenBehavior.touch();
end;

procedure Phone.takePhoto();
begin
  _cameraBehavior.photo();
end;

procedure Phone.enable();
begin
  writeln('Turning on...');
end;
//------------------------------------------------------------------------------
constructor IPhone.Create();
begin
  _cameraBehavior := TripleCamera.Create;
  _touchScreenBehavior := WithTouch.Create;
end;

procedure IPhone.display();
begin
  writeln('iPhone 11 Pro Max');
end;

//------------------------------------------------------------------------------
constructor Nokia.Create();
begin
  _cameraBehavior := NoCamera.Create;
  _touchScreenBehavior := NoTouch.Create;
end;

procedure Nokia.display();
begin
  writeln('Nokia 3310');
end;

//------------------------------------------------------------------------------
constructor Samsung.Create();
begin
  _cameraBehavior := OneCamera.Create;
  _touchScreenBehavior := WithTouch.Create;
end;

procedure Samsung.display;
begin
  writeln('Samsung Galaxy S10');
end;

//------------------------------------------------------------------------------
var
  n: Nokia;
  i: IPhone;

begin
  //Айфон с сенсорным экраном и тройной камерой
  i := IPhone.Create();
  i.display;
  i.enable();
  i.performScreen();
  i.takePhoto();
  writeln;

  //Нокиа со стеклянным экраном без камеры
  n := Nokia.Create();
  n.display;
  n.enable();
  n.performScreen();
  n.takePhoto();
  writeln;

  writeln('Press Enter');
  readln;
end.
