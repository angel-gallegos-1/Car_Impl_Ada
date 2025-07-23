with Ada.Text_IO; use Ada.Text_IO;
with Ada.Characters.Handling;
package body Alarm is




function persists(other: in out Prev_Alarm_Button_State) return Boolean is
   begin
      if other(1) = True and other(2) = True then
         return True;
      end if;
      return False;
   end persists;

   procedure update_button_states(other: in out Prev_Alarm_Button_State;Alarm_Button: in Boolean) is 
   
   begin 
      other(1) := other(2);
      other(2):= Alarm_Button;
   end update_button_states;


function transition(other: in out Prev_Alarm_Button_State;inp_state: in A_State; start_state: in Starter_State ;Alarm_Button: in Boolean) return A_State is 
   begin

      if inp_state = Disabled and Alarm_Button = True and start_state.state = Off then
         update_button_states(other,Alarm_Button);
         return Enabled;
      end if; 

      if inp_state = Enabled and persists(other) and Alarm_Button = True   then 
         update_button_states(other,Alarm_Button);
         return  Disabled;
      end if;

      update_button_states(other,Alarm_Button);
      return inp_state;
   
   end transition;

   procedure step(other: in out Prev_Alarm_Button_State; a_state: in out Alarm_State;start_state:in Starter_State; Alarm_Button: in Boolean)is
   begin
      a_state.state := transition(other,a_state.state,start_state,Alarm_Button);
   end step;
   
end Alarm;