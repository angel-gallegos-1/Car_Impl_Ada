package Starter is

   type S_State is (Started,Starting, Off );
   for S_State use (Started => 0,Starting => 1, Off => 2 );

   type Prev_Start_Button_State is  array (1..2) of Boolean;

   function persists(other: in out Prev_Start_Button_State) return Boolean;

   procedure update_button_states(other: in out Prev_Start_Button_State;start_button: in Boolean);

   function Initialize_State return S_State;

   type Starter_State is tagged record
      state : S_State := Initialize_State;
   end record;

   function Transition(
      other : in out Prev_Start_Button_State;
      inp_state   : in out S_State;
      start_button : in Boolean;
      speed : in Integer
   ) return S_State;

   procedure step(
      other: in out Prev_Start_Button_State;
      s_state     : in out Starter_State;
      start_button : in Boolean;
      speed : in Integer
   );

end Starter;
