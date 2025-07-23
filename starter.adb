package body Starter is

    --Initialization function for state
   function Initialize_State return S_State is
   begin
      return Off;
   end Initialize_State;

  

   function persists(other: in out Prev_Start_Button_State) return Boolean is
   begin
      if other(1) = True and other(2) = True then
         return True;
      end if;
      return False;
   end persists;

   procedure update_button_states(other: in out Prev_Start_Button_State;start_button: in Boolean) is 
   
   begin 
      other(1) := other(2);
      other(2):= start_button;
   end update_button_states;


   function transition(other: in out Prev_Start_Button_State;inp_state: in out S_State; start_button: Boolean;speed : Integer) return S_State is 
   begin
      if inp_state = Off and start_button = True then
         update_button_states (other, start_button);
         return Starting;
      end if;
      
      if inp_state /= Off and speed = 0 and persists(other) and start_button = True then
         update_button_states(other,start_button);
         return Off;
      end if;

      if inp_state /= Off and speed /= 0 and persists(other) and start_button = True then
         update_button_states(other,start_button);
         return inp_state;
      end if;

      update_button_states(other,start_button);
      return inp_state;
   end transition;

   procedure step(other: in out Prev_Start_Button_State;s_state: in out  Starter_State;start_button: Boolean; speed : Integer)is
   begin
      s_state.state := transition(other,s_state.state,start_button,speed);
   end step;
   
end Starter;