unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
function f(x: real): real;
begin
  f:=exp(x)-(1/x)-1;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  a, b, eps, x: real ;
  Ta, Tb:string;
  Code:byte;
  i:real;
begin
  memo1.Clear;
  val(edit1.text,a,code);
  if(code=0)then begin
  val(edit2.text,b,code);
  if(code=0)then begin
  val(edit3.text,eps,code);
  if(code=0)then begin
  Code:=0;
  repeat
    Code:=Code+1;
    x:=(a+b)/2; // точка с запятой
    if f(a)*f(x)<0 then b:=x
    else a:=x;
    if (Code>100) then begin
    memo1.lines.add('Невозможно вычислить');
    exit;
    end
  until abs(f(x))<eps;//епс вместо еп
  val(edit1.text,a,code);
  val(edit2.text,b,code);
  i:=a;
  Chart1LineSeries1.Clear;
  while (i<b) do   begin
  Chart1LineSeries1.AddXY(i,f(i));
  i:=i+0.01;
  end;
  Str(x:3:3,Ta);
  Str(F(x):4:4,Tb);
  memo1.lines.add('x='+Ta);
  memo1.lines.add('F(x)='+Tb);
end else memo1.lines.add('Точность введена неверно');
end else memo1.lines.add('Конечная граница введена неверно');
end else memo1.lines.add('Начальная граница введена неверно');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

end.

