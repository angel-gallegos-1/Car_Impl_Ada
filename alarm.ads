with Starter;use Starter;

package Alarm is

   

   type A_State is (Disabled, Enabled);
   for A_State use (Disabled => 0, Enabled => 1);
   
   type Prev_Alarm_Button_State is  array (1..2) of Boolean;

   type Alarm_State is tagged record
      state : A_State := Disabled;
   end record;


   function persists(other: in out Prev_Alarm_Button_State) return Boolean;

   procedure update_button_states(other: in out Prev_Alarm_Button_State;Alarm_Button: in Boolean);


   function Transition(
      other: in out Prev_Alarm_Button_State;
      inp_state    : in A_State;
      start_state : in Starter_State;
      Alarm_Button  : in Boolean
   ) return A_State;

   procedure step(
      other: in out Prev_Alarm_Button_State;
      a_state       : in out Alarm_State;
      start_state : in Starter_State;
      Alarm_Button  : in Boolean
   );

end Alarm;
