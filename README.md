<h1 align="center">GMStates</h1>
<h4 align="center">A simple state machine for GameMaker.</h4>

## Basic setup
- Create a script in GameMaker.
- Copy code from [GMStates.gml](https://github.com/maklore/GMStates/blob/main/GMStates.gml) and paste to script.
  
  > An example on how you can use it, please don't use the actual examples.
- Create an object.
- Initialise the state system in objects `Create` event.
  ```gml
  STATES = new GMStates();
  ```
- Create new states in objects `Create` event.
  ```gml
  STATES.create("count");
  STATES.create("exit");
  ```
- Set state cycles (STATE_ENTER, STATE_UPDATE, and STATE_LEAVE) in objects `Create` event.
  ```gml
  //Set the ENTER state for "count".
  STATES.set("count", STATE_ENTER, function() {
    show_debug_message("Entered Count State.");
  );
  
  //Set the UPDATE state for "count".
  STATES.set("count", STATE_UPDATE, function() {
    static __time = 0;
    show_debug_message(_time);
    if __time >= 60 {
      //Change to next state once __time reaches 60.
      STATES.change("exit"); 
    } else {
      __time += 1 / 60;
    }
  );

  //Set the LEAVE state for "count".
  STATES.set("count", STATE_LEAVE, function() {
    show_debug_message("Left Count State.");
  );

  //Set the ENTER state for "exit".
  STATES.set("exit", STATE_ENTER, function() {
    show_debug_message("Entered Exit State.");
  );

  //Set the UPDATE state for "exit".
  STATES.set("exit", STATE_UPDATE, function() {
    static __exit = false;
    if !__exit {
      //End the game.
      game_end();
      __exit = true;
    }
  );
  
  ```
- Call state cycles in objects `step` event.
  ```gml
  STATES.update();
  ```

- Have fun!
  
