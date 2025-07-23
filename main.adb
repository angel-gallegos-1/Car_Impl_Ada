with Alarm;
with Starter;
with Car;use Car;
with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
   other_a: Alarm.Prev_Alarm_Button_State := (False,False);
   other_s: Starter.Prev_Start_Button_State := (False,False);
   car : Car_State;
   procedure drive_car is begin
      
      Put_Line ("Starting Car");
      Start(other_a,other_s,car);
      Put_Line ("Car_Started");

   end drive_car;
      


begin

   drive_car;

end Main;