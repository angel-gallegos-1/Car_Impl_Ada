
package body Car is 


   procedure Step(other_alarm: in out Prev_Alarm_Button_State ;other_starter: in out Prev_Start_Button_State;c_state: in out Car_State; speed : Integer) is 
   begin
      Starter.step(other_starter,c_state.starter,c_state.start_button, speed);
      Alarm.step(other_alarm,c_state.alarm,c_state.starter, c_state.alarm_button);
   end Step;

   procedure Start(other_alarm: in out Prev_Alarm_Button_State ;other_starter: in out Prev_Start_Button_State;c_state: in out Car_State) is 

   begin

   c_state.start_button:=True;
   Step(other_alarm, other_starter,c_state, 0);
   c_state.start_button:=False;
   Step(other_alarm, other_starter,c_state, 0);

   end Start;



end Car;